/*9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage*/
#SELECT  
#d.channel, 
#ROUND(SUM(g.gross_price * f.sold_quantity) / 1000000, 2) AS gross_sales_mln, 
#ROUND(SUM(g.gross_price * f.sold_quantity) / SUM(SUM(g.gross_price * f.sold_quantity)) OVER () * 100, 2) AS percentage
#FROM fact_sales_monthly f
#INNER JOIN fact_gross_price g
#ON f.product_code = g.product_code
#AND f.fiscal_year = g.fiscal_year 
#INNER JOIN dim_customer d
#ON f.customer_code = d.customer_code
#WHERE f.fiscal_year = 2021 
#GROUP BY d.channel
#ORDER BY gross_sales_mln DESC
#LIMIT 1


#CTE
WITH SalesCh AS (SELECT  d.channel, SUM(g.gross_price * f.sold_quantity) AS gross_sales,SUM(SUM(g.gross_price * f.sold_quantity)) OVER () AS total_sales
FROM fact_sales_monthly f
INNER JOIN fact_gross_price g
ON f.product_code = g.product_code
AND f.fiscal_year = g.fiscal_year
INNER JOIN dim_customer d
ON f.customer_code = d.customer_code
WHERE f.fiscal_year = 2021
GROUP BY d.channel
)
SELECT  
channel, ROUND(gross_sales / 1000000, 2) AS gross_sales_mln,ROUND((gross_sales / total_sales) * 100, 2) AS percentage
FROM SalesCh
ORDER BY gross_sales_mln DESC






