/*
===============================================================================
Part-To-Whole Analysis
===============================================================================
Purpose:
    Measure contribution percentage.
===============================================================================
*/

-- Sales contribution by category

with category_sales as (

select
    category,
    sum(sales_amount) as total_sales

from fact_sales f
left join dim_product p
    on f.product_key = p.product_key

group by category
)

select
    category,
    total_sales,
    sum(total_sales) over() as overall_sales,

    concat(
        round(
            cast(total_sales as float)
            / sum(total_sales) over() * 100,
            2
        ),
        '%'
    ) as percentage_of_total

from category_sales
order by total_sales desc;


-- Quantity contribution by category

with category_quantity as (

select
    category,
    sum(quantity) as total_quantity

from fact_sales f
left join dim_product p
    on f.product_key = p.product_key

group by category
)

select
    category,
    total_quantity,
    sum(total_quantity) over() as overall_quantity,

    concat(
        round(
            cast(total_quantity as float)
            / sum(total_quantity) over() * 100,
            2
        ),
        '%'
    ) as percentage_of_total

from category_quantity
order by total_quantity desc;
