/* Provide the list of markets in which customer  "Atliq  Exclusive"  operates its 
business in the  APAC  region.*/

#Normal Format#
#SELECT market,customer,region
#From dim_customer
#WHERE customer = "Atliq Exclusive" 
#AND region="APAC";  

#Subqueries#
#SELECT market, customer, region
#FROM (
# SELECT market, customer, region
#  FROM dim_customer
 #   WHERE customer = 'Atliq Exclusive'
#) AS temp_table
#WHERE region = 'APAC';

#CTE#
WITH cte_customer AS (
    SELECT market, customer, region
    FROM dim_customer
    WHERE customer = 'Atliq Exclusive'
)
SELECT market
FROM cte_customer
WHERE region = 'APAC'
GROUP by market;
