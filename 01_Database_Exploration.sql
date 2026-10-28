/* Database Exploration */

-- Explore all tables

SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- Explore all columns

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS;

-- Explore customer table columns

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers';

-- Explore product table columns

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_product';

-- Explore sales table columns

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'fact_sales';
