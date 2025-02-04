SELECT 
COUNT(DISTINCT CASE WHEN f.fiscal_year = 2020 THEN f.product_code END) AS unique_products_2020,
COUNT(DISTINCT CASE WHEN f.fiscal_year = 2021 THEN f.product_code END) AS unique_products_2021,(
(COUNT(DISTINCT CASE WHEN f.fiscal_year = 2021 THEN f.product_code END)-COUNT(DISTINCT CASE WHEN f.fiscal_year = 2020 THEN f.product_code END))*100
/ NULLIF(COUNT(DISTINCT CASE WHEN f.fiscal_year = 2020 THEN f.product_code END), 0)
)AS percentage_chg
    FROM fact_sales_monthly f
INNER JOIN dim_product d
ON f.product_code = d.product_code;

#CTE 
WITH my_tb AS (SELECT 
COUNT(DISTINCT CASE WHEN f.fiscal_year = 2020 THEN f.product_code END) AS unique_products_2020,
COUNT(DISTINCT CASE WHEN f.fiscal_year = 2021 THEN f.product_code END) AS unique_products_2021,ROUND(
(COUNT(DISTINCT CASE WHEN f.fiscal_year = 2021 THEN f.product_code END)-COUNT(DISTINCT CASE WHEN f.fiscal_year = 2020 THEN f.product_code END))*100
/ NULLIF(COUNT(DISTINCT CASE WHEN f.fiscal_year = 2020 THEN f.product_code END), 0)
)AS percentage_chg
    FROM fact_sales_monthly AS f
INNER JOIN dim_product AS d
ON f.product_code = d.product_code
)
select tb.unique_products_2020, tb.unique_products_2021,tb.percentage_chg
FROM my_tb AS tb;