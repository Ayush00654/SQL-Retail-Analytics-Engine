/*
===============================================================================
Product Report
===============================================================================

Purpose:
    - This report consolidates key product metrics and behaviors.

Highlights:

    1. Gathers essential fields such as product name, category,
       subcategory, and cost.

    2. Segments products by revenue to identify:
       - High Performer
       - Mid Range
       - Low Performer

    3. Aggregates product-level metrics:
       - total orders
       - total sales
       - total quantity sold
       - total customers
       - lifespan

    4. Calculates valuable KPIs:
       - recency
       - average selling price
       - average order revenue
       - average monthly revenue

===============================================================================
*/

CREATE VIEW report_products AS

WITH base_query AS (

    -- Base query

    SELECT
        f.order_number,
        f.order_date,
        f.customer_key,
        f.sales_amount,
        f.quantity,

        p.product_key,
        p.product_name,
        p.category,
        p.subcategory,
        p.product_cost

    FROM fact_sales f
    LEFT JOIN dim_product p
        ON f.product_key = p.product_key

    WHERE order_date IS NOT NULL
),

product_aggregations AS (

    SELECT

        product_key,
        product_name,
        category,
        subcategory,
        product_cost,

        DATEDIFF(
            MONTH,
            MIN(order_date),
            MAX(order_date)
        ) AS lifespan_month,

        MAX(order_date) AS last_order_date,

        COUNT(DISTINCT order_number) AS total_orders,

        COUNT(DISTINCT customer_key) AS total_customers,

        SUM(sales_amount) AS total_sales,

        SUM(quantity) AS total_quantity,

        ROUND(
            AVG(
                CAST(sales_amount AS FLOAT)
                / NULLIF(quantity,0)
            ),
            1
        ) AS avg_selling_price

    FROM base_query

    GROUP BY
        product_key,
        product_name,
        category,
        subcategory,
        product_cost
)

SELECT

    product_key,
    product_name,
    category,
    subcategory,
    product_cost,

    last_order_date,

    DATEDIFF(
        MONTH,
        last_order_date,
        GETDATE()
    ) AS recency_in_month,

    CASE
        WHEN total_sales > 50000
        THEN 'High Performer'

        WHEN total_sales >= 10000
        THEN 'Mid Range'

        ELSE 'Low Performer'
    END AS product_segment,

    lifespan_month,
    total_orders,
    total_sales,
    total_quantity,
    total_customers,
    avg_selling_price,

    CASE
        WHEN total_orders = 0 THEN 0
        ELSE CAST(total_sales AS DECIMAL(18,2))
             / NULLIF(total_orders,0)
    END AS avg_order_revenue,

    CASE
        WHEN lifespan_month = 0 THEN total_sales
        ELSE CAST(total_sales AS DECIMAL(18,2))
             / NULLIF(lifespan_month,0)
    END AS avg_monthly_revenue

FROM product_aggregations;
GO

-- Validation

SELECT *
FROM report_products;
