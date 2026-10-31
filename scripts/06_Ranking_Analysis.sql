-- Which 5 products generate the highest revenue

SELECT TOP 5
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM fact_sales f
LEFT JOIN dim_product p
    ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- Using ROW_NUMBER()

SELECT *
FROM
(
    SELECT
        p.product_name,
        SUM(f.sales_amount) AS total_revenue,
        ROW_NUMBER() OVER
        (
            ORDER BY SUM(f.sales_amount) DESC
        ) AS product_rank
    FROM fact_sales f
    LEFT JOIN dim_product p
        ON f.product_key = p.product_key
    GROUP BY p.product_name
) t
WHERE product_rank <= 5;

-- Using DENSE_RANK()

SELECT *
FROM
(
    SELECT
        p.product_name,
        SUM(f.sales_amount) AS total_revenue,
        DENSE_RANK() OVER
        (
            ORDER BY SUM(f.sales_amount) DESC
        ) AS product_rank
    FROM fact_sales f
    LEFT JOIN dim_product p
        ON f.product_key = p.product_key
    GROUP BY p.product_name
) t
WHERE product_rank <= 5;

-- Top 10 customers by revenue

SELECT *
FROM
(
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(f.sales_amount) AS total_revenue,
        DENSE_RANK() OVER
        (
            ORDER BY SUM(f.sales_amount) DESC
        ) AS cust_revenue_rank
    FROM fact_sales f
    LEFT JOIN dim_customers c
        ON f.customer_key = c.customer_key
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
) t
WHERE cust_revenue_rank <= 10;

SELECT TOP 10
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(f.sales_amount) AS total_revenue
FROM fact_sales f
LEFT JOIN dim_customers c
    ON f.customer_key = c.customer_key
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC;

-- 3 customers with fewest orders

SELECT *
FROM
(
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        COUNT(DISTINCT order_number) AS no_order_placed,
        DENSE_RANK() OVER
        (
            ORDER BY COUNT(DISTINCT order_number)
        ) AS cust_revenue_rank
    FROM fact_sales f
    LEFT JOIN dim_customers c
        ON f.customer_key = c.customer_key
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
) t
WHERE cust_revenue_rank <= 3;

SELECT TOP 3
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT order_number) AS no_order_placed
FROM fact_sales f
LEFT JOIN dim_customers c
    ON f.customer_key = c.customer_key
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY no_order_placed;

-- 5 worst performing products

SELECT TOP 5
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM fact_sales f
LEFT JOIN dim_product p
    ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue;

-- Best performing subcategories

SELECT TOP 5
    p.subcategory,
    SUM(f.sales_amount) AS total_revenue
FROM fact_sales f
LEFT JOIN dim_product p
    ON f.product_key = p.product_key
GROUP BY p.subcategory
ORDER BY total_revenue DESC;

-- Worst performing subcategories

SELECT TOP 5
    p.subcategory,
    SUM(f.sales_amount) AS total_revenue
FROM fact_sales f
LEFT JOIN dim_product p
    ON f.product_key = p.product_key
GROUP BY p.subcategory
ORDER BY total_revenue;
