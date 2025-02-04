/*4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference*/

#SELECT segment, COUNT(DISTINCT CASE WHEN f.fiscal_year = 2020 THEN f.product_code END) AS products_2020,
#COUNT(DISTINCT CASE WHEN f.fiscal_year = 2021 THEN f.product_code END) AS products_2021,
#(COUNT(DISTINCT CASE WHEN f.fiscal_year = 2021 THEN f.product_code END)-COUNT(DISTINCT CASE WHEN f.fiscal_year = 2020 THEN f.product_code END)) AS difference
 #FROM fact_sales_monthly f
#INNER JOIN dim_product d
#ON f.product_code = d.product_code
#Group by segment

WITH my_p AS(SELECT segment, COUNT(DISTINCT CASE WHEN f.fiscal_year = 2020 THEN f.product_code END) AS products_2020,
COUNT(DISTINCT CASE WHEN f.fiscal_year = 2021 THEN f.product_code END) AS products_2021,
(COUNT(DISTINCT CASE WHEN f.fiscal_year = 2021 THEN f.product_code END)-COUNT(DISTINCT CASE WHEN f.fiscal_year = 2020 THEN f.product_code END)) AS difference
FROM fact_sales_monthly f
INNER JOIN dim_product d
ON f.product_code = d.product_code
Group by segment
)
#SELECT * FROM my_p
SELECT p.segment,p.products_2020,p.products_2021,p.difference
FROM my_p as p;

