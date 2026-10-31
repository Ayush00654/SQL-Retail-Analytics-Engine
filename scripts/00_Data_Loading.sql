/*
=============================================================
Create Database and Load Data
=============================================================

Script Purpose:
    This script creates a new database named 'Sales_EDA'.

    It also:
    1. Creates dimension and fact tables
    2. Loads CSV files using BULK INSERT
    3. Prepares the database for EDA analysis

WARNING:
    Running this script will drop the entire 'Sales_EDA'
    database if it already exists.

Note:
    Change the BULK INSERT file paths if your CSV files are
    stored in a different location.
*/

USE master;
GO

/*=========================================================
Drop Existing Database
=========================================================*/

IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'Sales_EDA'
)
BEGIN
    ALTER DATABASE Sales_EDA
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    DROP DATABASE Sales_EDA;
END;
GO

/*=========================================================
Create Database
=========================================================*/

CREATE DATABASE Sales_EDA;
GO

USE Sales_EDA;
GO

/*=========================================================
Create Customer Dimension
=========================================================*/

CREATE TABLE dim_customers
(
    customer_key INT,
    customer_id INT,
    customer_number NVARCHAR(50),
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    marital_status NVARCHAR(50),
    gender NVARCHAR(50),
    create_date DATE,
    birthdate DATE,
    country NVARCHAR(50)
);
GO


/*=========================================================
Create Product Dimension
=========================================================*/

CREATE TABLE dim_product
(
    product_key INT,
    product_id INT,
    product_number NVARCHAR(50),
    product_name NVARCHAR(100),
    category_id NVARCHAR(50),
    category NVARCHAR(50),
    subcategory NVARCHAR(50),
    maintenance NVARCHAR(50),
    product_cost INT,
    product_line NVARCHAR(50),
    product_start_date DATE
);
GO

/*=========================================================
Create Sales Fact Table
=========================================================*/

CREATE TABLE fact_sales
(
    order_number NVARCHAR(50),
    product_key INT,
    customer_key INT,
    order_date DATE,
    shipping_date DATE,
    due_date DATE,
    sales_amount INT,
    quantity INT,
    price INT
);
GO

/*=========================================================
Load Customer Data
=========================================================*/

TRUNCATE TABLE dim_customers;
GO

BULK INSERT dim_customers
FROM 'C:\Users\ayyu1\Downloads\dim_customers.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
     KEEPNULLS,
    TABLOCK
);
GO

/*=========================================================
Load Product Data
=========================================================*/

TRUNCATE TABLE dim_product;
GO

BULK INSERT dim_product
FROM 'C:\Users\ayyu1\Downloads\dim_product.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
GO

/*=========================================================
Load Sales Data
=========================================================*/

TRUNCATE TABLE fact_sales;
GO

BULK INSERT fact_sales
FROM 'C:\Users\ayyu1\Downloads\fact.Sales.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
GO

/*=========================================================
Validation Checks
=========================================================*/

SELECT COUNT(*) AS total_customers
FROM dim_customers;

SELECT COUNT(*) AS total_products
FROM dim_product;

SELECT COUNT(*) AS total_sales_records
FROM fact_sales;
GO
