-- Find the date of first and last order
SELECT order_date
FROM fact_sales;

SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM fact_sales;

-- How many years of sales data are available
SELECT
    DATEDIFF(YEAR, MIN(order_date), MAX(order_date)) AS yr_of_salesdata
FROM fact_sales;

-- Find youngest and oldest customers
SELECT
    MAX(birthdate) AS youngest_cust_dob,
    DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS youngest_cust_age,
    MIN(birthdate) AS oldest_cust_dob,
    DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS oldest_cust_age
FROM dim_customers;
