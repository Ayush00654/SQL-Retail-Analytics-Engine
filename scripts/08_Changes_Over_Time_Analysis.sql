/*
===============================================================================
Changes Over Time Analysis
===============================================================================
Purpose:
    Analyze business trends over time.
===============================================================================
*/

select
    datetrunc(month, order_date) as order_date,
    sum(sales_amount) as total_amount,
    count(distinct customer_key) as total_customers,
    sum(quantity) as total_quantity
from fact_sales
where order_date is not null
group by datetrunc(month, order_date)
order by datetrunc(month, order_date);

select
    format(datetrunc(month, order_date), 'yyyy-MMM') as order_date,
    sum(sales_amount) as total_amount,
    count(distinct customer_key) as total_customers,
    sum(quantity) as total_quantity
from fact_sales
where order_date is not null
group by datetrunc(month, order_date)
order by datetrunc(month, order_date);
