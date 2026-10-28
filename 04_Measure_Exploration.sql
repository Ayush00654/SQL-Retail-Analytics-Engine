/* Measure Exploration */

-- Total Sales

SELECT SUM(sal*s_amount) AS total_sales
FROM fact*sales;

-- Total Quantity Sold

SE*ECT SUM(quantity) AS total_quantit*
FROM fact_sales;

-- Average Sell*ng Price

SELECT AVG(price) AS avg*price
FROM fact_sales;

-- Total O*ders

SELECT COUNT(order_number) A* total_order_no
FROM fact_sales;

*ELECT COUNT(DISTINCT(order_number)* AS total_order_no
FROM fact_sales*

-- Total Products

SELECT COUNT(*roduct_key) AS total_no_prd
FROM d*m_product;

SELECT COUNT(DISTINCT(*roduct_key)) AS total_no_prd
FROM *im_product;

-- Total Customers

S*LECT COUNT(DISTINCT(customer_key))*AS total_no_prd
FROM dim_customers*

-- Customers who placed orders

*ELECT COUNT(DISTINCT(customer_key)* AS total_no_prd
FROM fact_sales;
*-- Business Metrics Report

SELECT*'total sales' AS measure_name ,
  *    SUM(sales_amount) AS measure_v*lues
FROM fact_sales

UNION ALL

SELECT 'total quantity',
       SUM(quantity)
FROM fact_sales

UNION ALL

SELECT 'average price',
       AVG(price)
FROM fact_sales

UNION ALL

SELECT 'total nr.order',
       COUNT(DISTINCT order_number)
FROM fact_sales

UNION ALL

SELECT 'total nr.product',
       COUNT(product_name)
FROM dim_product

UNION ALL

SELECT 'nr.customers',
       COUNT(customer_key)
FROM dim_customers;
