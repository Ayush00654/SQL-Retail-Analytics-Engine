-- Find the Total Sales
SELECT SUM(sales_amount) AS total_sales
FROM fact_sales;

-- Find how many items are sold
SELECT SUM(quantity) AS total_quantity
FROM fact_sales;

-- Find the average selling price
SELECT AVG(price) AS avg_price
FROM fact_sales;

-- Find total number of orders
SELECT COUNT(order_number) AS total_order_no
FROM fact_sales;

SELECT COUNT(DISTINCT order_number) AS total_order_no
FROM fact_sales;

-- Find total number of products
SELECT COUNT(product_key) AS total_no_prd
FROM dim_product;

SELECT COUNT(DISTINCT product_key) AS total_no_prd
FROM dim_product;

-- Find total number of customers
SELECT COUNT(DISTINCT customer_key) AS total_no_customers
FROM dim_customers;

-- Find total number of customers that placed an order
SELECT COUNT(DISTINCT customer_key) AS total_no_customers
FROM fact_sales;

-- Business KPI Report
SELECT 'Total Sales' AS measure_name,
       SUM(sales_amount) AS measure_values
FROM fact_sales

UNION ALL

SELECT 'Total Quantity',
       SUM(quantity)
FROM fact_sales

UNION ALL

SELECT 'Average Price',
       AVG(price)
FROM fact_sales

UNION ALL

SELECT 'Total Nr. Orders',
       COUNT(DISTINCT order_number)
FROM fact_sales

UNION ALL

SELECT 'Total Nr. Products',
       COUNT(product_name)
FROM dim_product

UNION ALL

SELECT 'Total Nr. Customers',
       COUNT(customer_key)
FROM dim_customers;
