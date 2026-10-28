CREATE DATABASE Sales_EDA;
GO

USE Sales_EDA;
GO

SELECT *
INTO dim_customers
FROM Datawarehouse.gold.dim_customers;

SELECT *
INTO dim_product
FROM Datawarehouse.gold.dim_product;

SELECT *
INTO fact_sales
FROM Datawarehouse.gold.fact_sales;
