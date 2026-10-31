/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    Analyze running totals and moving averages.
===============================================================================
*/

-- Running total sales by month

select
    order_date,
    total_sales,
    sum(total_sales) over(order by order_date) as running_total_sales
from(
    select
        datetrunc(month, order_date) as order_date,
        sum(sales_amount) as total_sales
    from fact_sales
    where order_date is not null
    group by datetrunc(month, order_date)
)t;


-- Running total sales by year

select
    order_date,
    total_sales,
    sum(total_sales) over(order by order_date) as running_total_sales
from(
    select
        datetrunc(year, order_date) as order_date,
        sum(sales_amount) as total_sales
    from fact_sales
    where order_date is not null
    group by datetrunc(year, order_date)
)t;


-- Year-wise running total

select
    order_date,
    total_sales,
    sum(total_sales) over(
        partition by year(order_date)
        order by order_date
    ) as running_total_sales
from(
    select
        datetrunc(month, order_date) as order_date,
        sum(sales_amount) as total_sales
    from fact_sales
    where order_date is not null
    group by datetrunc(month, order_date)
)t;


-- Running average price

select
    order_date,
    total_sales,
    sum(total_sales) over(
        partition by year(order_date)
        order by order_date
    ) as running_total_sales,

    avg(avg_price) over(
        order by order_date
    ) as moving_avg_price

from(
    select
        datetrunc(month, order_date) as order_date,
        sum(sales_amount) as total_sales,
        avg(price) as avg_price
    from fact_sales
    where order_date is not null
    group by datetrunc(month, order_date)
)t;
