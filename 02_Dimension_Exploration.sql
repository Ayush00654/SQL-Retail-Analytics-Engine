-- Explore all the countries our customers come from
SELECT DISTINCT country
FROM dim_customers;

-- Explore all categories of products
SELECT DISTINCT category
FROM dim_product;

SELECT DISTINCT
    category,
    subcategory
FROM dim_product;

SELECT DISTINCT
    category,
    subcategory,
    product_name
FROM dim_product
ORDER BY 1,2,3;
