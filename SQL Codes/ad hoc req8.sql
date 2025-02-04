/*8. In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity*/

WITH DerivedData AS (SELECT CASE
WHEN MONTH(date) IN (9, 10, 11) THEN CONCAT(YEAR(date), '-Q1') 
WHEN MONTH(date) IN (12, 1, 2) THEN CONCAT(YEAR(date) + CASE WHEN MONTH(date) = 12 THEN 0 ELSE -1 END, '-Q2')  
WHEN MONTH(date) IN (3, 4, 5) THEN CONCAT(YEAR(date), '-Q3')  
WHEN MONTH(date) IN (6, 7, 8) THEN CONCAT(YEAR(date), '-Q4') 
END AS Quarter,
sold_quantity
FROM fact_sales_monthly
WHERE fiscal_year = 2020 
),
A_Data AS (SELECT Quarter,SUM(sold_quantity) AS total_sold_quantity
FROM DerivedData
GROUP BY Quarter
)
SELECT
Quarter,
total_sold_quantity
FROM A_Data
ORDER BY total_sold_quantity DESC  
