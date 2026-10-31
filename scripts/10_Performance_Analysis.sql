/*
===============================================================================
Performance Analysis
===============================================================================
Purpose:
    Compare current performance against
    average performance and previous year performance.
===============================================================================
*/

with yearly_product_sales as (

select
    year(f.order_date) as order_year,
    p.product_name,
    sum(f.sales_amount) as current_sales

from fact_sales f
left join dim_product p
    on f.product_key = p.product_key

where f.order_date is not null

group by
    year(f.order_date),
    p.product_name
)

select
    order_year,
    product_name,
    current_sales,

    avg(current_sales) over(
        partition by product_name
    ) as avg_sales,

    current_sales -
    avg(current_sales) over(
        partition by product_name
    ) as diff_in_avg_sales,

    case
        when current_sales -
             avg(current_sales) over(
                partition by product_name
             ) > 0
        then 'Above Average'

        when current_sales -
             avg(current_sales) over(
                partition by product_name
             ) < 0
        then 'Below Average'

        else 'Average'
    end as avg_change,

    lag(current_sales) over(
        partition by product_name
        order by order_year
    ) as previous_year_sales,

    current_sales -
    lag(current_sales) over(
        partition by product_name
        order by order_year
    ) as diff_previous_year_sales,

    case
        when current_sales -
             lag(current_sales) over(
                partition by product_name
                order by order_year
             ) > 0
        then 'Increasing'

        when current_sales -
             lag(current_sales) over(
                partition by product_name
                order by order_year
             ) < 0
        then 'Decreasing'

        else 'No Change'
    end as change_in_sales

from yearly_product_sales
order by product_name, order_year;
        else 'No Change'
    end as change_in_sales

from yearly_product_sales
order by product_name, order_year;
