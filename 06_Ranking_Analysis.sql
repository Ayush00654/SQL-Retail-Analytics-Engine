/**Ranking Analysis */

-------------*----------------------------------*
-- Top 5 Products by Revenue
----*----------------------------------*---------

SELECT TOP 5
    p.prod*ct_name,
    SUM(f.sales_amount) A* total_revenue
FROM fact_sales f
L*FT JOIN dim_product p
ON*f.product_key = p.product_key
GROU* BY p.product_name
ORDER BY total_*evenue DESC;

--------------------*----------------------------
-- To* 5 Products Using ROW_NUMBER()
---*----------------------------------*----------

SELECT *
FROM
(
   *SELECT
        p.product_name,
   *    SUM(f.sales_amount) AS total_r*venue,
        ROW_NUMBER() OVER
 *      (
            ORDER BY SUM(f*sales_amount) DESC
        ) AS pr*duct_rank
    FROM fact_sales f
  * LEFT JOIN dim_product p
    ON f.*roduct_key = p.product_key
    GRO*P BY p.product_name
) t
WHERE prod*ct_rank <= 5;

-------------------*-----------------------------
-- T*p 5 Products Using DENSE_RANK()
--*----------------------------------*-----------

SELECT *
FROM
(
    S*LECT
        p.product_name,
     *  SUM(f.sales_amount) AS total_rev*nue,
        DENSE_RANK() OVER
   *    (
            ORDER BY SUM(f.s*les_amount) DESC
        ) AS prod*ct_rank
    FROM fact_sales f
    *EFT JOIN dim_product p
    ON f.pr*duct_key = p.product_key
    GROUP*BY p.product_name
) t
WHERE produc*_rank <= 5;

---------------------*---------------------------
-- Top*10 Customers by Revenue
----------*----------------------------------*---

SELECT *
FROM
(
    SELECT
  *     c.customer_id,
        c.firs*_name,
        c.last_name,
      * SUM(f.sales_amount) AS total_reve*ue,
        DENSE_RANK() OVER
    *   (
            ORDER BY SUM(f.sa*es_amount) DESC
        ) AS cust_*evenue_rank
    FROM fact_sales f
*   LEFT JOIN dim_customers c
    O* f.customer_key = c.customer_key
 *  GROUP BY
        c.customer_id,
*       c.first_name,
        c.las*_name
) t
WHERE cust_revenue_rank *= 10;

---------------------------*---------------------
-- Top 10 Cu*tomers Using TOP
-----------------*-------------------------------

S*LECT TOP 10
    c.customer_id,
   *c.first_name,
    c.last_name,
   *SUM(f.sales_amount) AS total_reven*e
FROM fact_sales f
LEFT JOIN dim_*ustomers c
ON f.customer_key = c.c*stomer_key
GROUP BY
    c.customer*id,
    c.first_name,
    c.last_n*me
ORDER BY total_revenue DESC;

-*----------------------------------*------------
-- 3 Customers with F*west Orders
----------------------*--------------------------

SELECT**
FROM
(
    SELECT
        c.cust*mer_id,
        c.first_name,
    *   c.last_name,
        COUNT(DIST*NCT order_number) AS no_order_palc*d,
        DENSE_RANK() OVER
     *  (
            ORDER BY COUNT(DIS*INCT order_number)
        ) AS cu*t_revenue_rank
    FROM fact_sales*f
    LEFT JOIN dim_customers c
  * ON f.customer_key = c.customer_ke*
    GROUP BY
        c.customer_i*,
        c.first_name,
        c.*ast_name
) t
WHERE no_order_palced*<= 3;

---------------------------*---------------------
-- Top 3 Cus*omers with Fewest Orders
---------*----------------------------------*----

SELECT TOP 3
    c.customer_*d,
    c.first_name,
    c.last_na*e,
    COUNT(DISTINCT order_number* AS no_order_palced
FROM fact_sale* f
LEFT JOIN dim_customers c
ON f.*ustomer_key = c.customer_key
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY no_order_palced;

-------------------------------------------------
-- 5 Worst Performing Products
-------------------------------------------------

SELECT TOP 5
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM fact_sales f
LEFT JOIN dim_product p
ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue;

-------------------------------------------------
-- Top 5 Best Performing Subcategories
-------------------------------------------------

SELECT TOP 5
    p.subcategory,
    SUM(f.sales_amount) AS total_revenue
FROM fact_sales f
LEFT JOIN dim_product p
ON f.product_key = p.product_key
GROUP BY p.subcategory
ORDER BY total_revenue DESC;

-------------------------------------------------
-- Top 5 Worst Performing Subcategories
-------------------------------------------------

SELECT TOP 5
    p.subcategory,
    SUM(f.sales_amount) AS total_revenue
FROM fact_sales f
LEFT JOIN dim_product p
ON f.product_key = p.product_key
GROUP BY p.subcategory
ORDER BY total_revenue;
