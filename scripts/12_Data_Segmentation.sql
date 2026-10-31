/*
===============================================================================
Data Segmentation
===============================================================================
Purpose:
    Segment products and customers.
===============================================================================
*/

-- Product Cost Segmentation

with product_segment as (

select
    product_key,
    product_name,
    product_cost,

    case
        when product_cost < 100 then 'Below 100'
        when product_cost between 100 and 500 then '100-500'
        when product_cost between 500 and 1000 then '500-1000'
        else 'Above 1000'
    end as cost_range

from dim_product
)

select
    cost_range,
    count(product_key) as total_products
from product_segment
group by cost_range
order by total_products desc;


-- Customer Segmentation

with customer_spending as (

select
    c.customer_key,
    sum(f.sales_amount) as total_spending,
    datediff(
        month,
        min(order_date),
        max(order_date)
    ) as lifespan

from fact_sales f
left join dim_customers c
    on f.customer_key = c.customer_key

group by c.customer_key
)

select
    customer_segment,
    count(customer_key) as total_customers

from(

    select
        customer_key,

        case
            when lifespan >= 12
                 and total_spending > 5000
            then 'VIP'

            when lifespan >= 12
                 and total_spending < 5000
            then 'Regular'

            else 'New'
        end as customer_segment

    from customer_spending

)t

group by customer_segment
order by total_customers desc;
