/*7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount*/

#SELECT MONTH (f.date) AS month , YEAR(f.date) AS year, SUM(g.gross_price*f.sold_quantity) AS Gross_Sales_Amount
#FROM fact_sales_monthly f
#INNER JOIN fact_gross_price g
#ON f.product_code= g.product_code
#INNER JOIN dim_customer d
#ON f.customer_code = d.customer_code
#WHERE 
#d.customer = 'Atliq Exclusive'
#GROUP BY 
#MONTH(f.date), YEAR(f.date)
#ORDER BY 
#YEAR(f.date), MONTH(f.date);

#CTE
WITH CTE_Gross_Sales AS (SELECT monthname(f.date) AS month,f.fiscal_year AS year,SUM(g.gross_price * f.sold_quantity) AS Gross_Sales_Amount
FROM 
fact_sales_monthly f
INNER JOIN 
fact_gross_price g
ON f.product_code = g.product_code
INNER JOIN 
dim_customer d
ON f.customer_code = d.customer_code
WHERE 
d.customer = 'Atliq Exclusive'
GROUP BY 
monthname(f.date), f.fiscal_year
)SELECT month,year,Gross_Sales_Amount
FROM 
CTE_Gross_Sales
ORDER BY year;












