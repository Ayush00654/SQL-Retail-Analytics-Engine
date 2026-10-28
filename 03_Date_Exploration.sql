/* Date Exploration */

-- Find first and last order dates

SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM fact_sales;

-- Find number of years of sales data available

SELECT
    DATEDIFF(YEAR, MIN(order_date), MAX(order_date)) AS yr_of_salesdata
FROM fact_sales;

-- Find youngest and oldest customers

SELECT
    MIN(birthdate) AS youngest_cust_dob,
    DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS youngest_cust_age,
    MIN(birthdate) AS oldest_cust_dob,
    DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS oldest_cust_age
FROM dim_customers;
