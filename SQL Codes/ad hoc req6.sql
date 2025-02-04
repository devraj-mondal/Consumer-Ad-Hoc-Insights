#SELECT c.customer_code,c.customer, AVG(p.pre_invoice_discount_pct) AS Avg_Discount_Pct
#FROM dim_customer c
#INNER JOIN fact_pre_invoice_deductions p
#ON c.customer_code = p.customer_code
#WHERE fiscal_year="2021" AND market ="India"
#GROUP BY c.customer_code,c.customer
#ORDER BY Avg_Discount_Pct DESC
#LIMIT 5;


#CTE
WITH my_Tab As(
SELECT c.customer_code,c.customer, ROUND(AVG(p.pre_invoice_discount_pct)*100,2) AS Avg_Discount_Pct 
FROM dim_customer c
INNER JOIN fact_pre_invoice_deductions p
ON c.customer_code = p.customer_code
WHERE fiscal_year="2021" AND market ="India"
GROUP BY c.customer_code,c.customer
ORDER BY Avg_Discount_Pct DESC
LIMIT 5
)
SELECT*FROM my_Tab 
