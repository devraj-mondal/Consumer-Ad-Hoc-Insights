#NORMAL QUERY
#(
#SELECT d.product_code, d.product, f.manufacturing_cost
#FROM dim_product d
#INNER JOIN fact_manufacturing_cost f
#ON d.product_code = f.product_code
#ORDER BY f.manufacturing_cost DESC
#LIMIT 1
#)
#UNION ALL
#(
#SELECT d.product_code, d.product, f.manufacturing_cost
#FROM dim_product d
#INNER JOIN fact_manufacturing_cost f
#ON d.product_code = f.product_code
#ORDER BY f.manufacturing_cost ASC
#LIMIT 1
#);



#CTE
WITH max_cost AS(
  SELECT d.product_code, d.product, f.manufacturing_cost
  FROM dim_product d
  INNER JOIN fact_manufacturing_cost f
  ON d.product_code = f.product_code
  ORDER BY f.manufacturing_cost DESC
  LIMIT 1
),
min_cost AS
(
  SELECT d.product_code, d.product, f.manufacturing_cost
  FROM dim_product d
  INNER JOIN fact_manufacturing_cost f
  ON d.product_code = f.product_code
  ORDER BY f.manufacturing_cost ASC
  LIMIT 1
)
SELECT * FROM max_cost 
UNION ALL
SELECT* FROM min_cost;