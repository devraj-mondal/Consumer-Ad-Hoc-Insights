
/*10. Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
product
total_sold_quantity*/
#SELECT d.division,d.product_code,d.product, SUM(f.sold_quantity) AS total_sold_quantity
#FROM dim_product d
#INNER JOIN fact_sales_monthly f
#ON d.product_code = f.product_code
#WHERE fiscal_year ="2021"
#GROUP BY product,division,product_code
#ORDER BY product DESC
#LIMIT 3;

#Subquery
#SELECT division,product_code,product,total_sold_quantity,rank_order
#FROM (
#SELECT d.division,d.product_code,d.product,
#SUM(f.sold_quantity) AS total_sold_quantity,
#RANK() OVER (PARTITION BY d.division 
#ORDER BY SUM(f.sold_quantity) DESC
#) AS rank_order
#FROM dim_product d
#INNER JOIN fact_sales_monthly f
#ON d.product_code = f.product_code
#WHERE f.fiscal_year = '2021'
#GROUP BY d.division, d.product_code, d.product
#) ranked_products
#WHERE rank_order <= 3
#ORDER BY division, rank_order;

#CTE
WITH RankedProducts AS (SELECT d.division,d.product_code,d.product,SUM(f.sold_quantity) AS total_sold_quantity,
RANK() OVER (
PARTITION BY d.division 
ORDER BY SUM(f.sold_quantity) DESC
) AS rank_order
FROM dim_product d
INNER JOIN fact_sales_monthly f
ON d.product_code = f.product_code
WHERE f.fiscal_year = '2021'
GROUP BY d.division, d.product_code, d.product
)
SELECT division,product_code,product,total_sold_quantity,rank_order
FROM RankedProducts
WHERE rank_order <= 3
ORDER BY division, rank_order;
