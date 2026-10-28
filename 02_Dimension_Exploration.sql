/* Dimension Exploration */

-- Explore all countries our customers come from

SELECT DISTINCT country
FROM dim_customers;

-- Explore all product categories

SELECT DISTINCT category
FROM dim_product;

-- Explore categories and subcategories

SELECT DISTINCT
    category,
    subcategory
FROM dim_product;

-- Explore products by category and subcategory

SELECT DISTINCT
    category,
    subcategory,
    product_name
FROM dim_product
ORDER BY 1,2,3;
