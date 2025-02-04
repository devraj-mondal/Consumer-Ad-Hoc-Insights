/*3. Provide a report with all the unique product counts for each segment and
sort them in descending order of product counts. The final output contains
2 fields,
segment
product_count*/
#SELECT segment, COUNT(DISTINCT product_code) AS Product_Count
#FROM dim_product
#Group by segment
#ORDER BY Product_Count DESC;



WITH my_p AS(
SELECT segment, COUNT(DISTINCT product_code) AS Product_Count
FROM dim_product
Group by segment
ORDER BY Product_Count DESC
)
SELECT p.segment,p.Product_Count
FROM my_p AS p
