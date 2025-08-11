WITH by_gender AS (
  SELECT c.gender, sp.model, SUM(s.units_sold) AS units
  FROM sales s
  JOIN customers c ON s.customer_id = c.customer_id
  JOIN smartphones sp ON s.product_id = sp.product_id
  GROUP BY c.gender, sp.model
),
ranked AS (
  SELECT
    gender, model, units,
    DENSE_RANK() OVER (PARTITION BY gender ORDER BY units DESC) AS rnk
  FROM by_gender
)
SELECT gender, model, units
FROM ranked
WHERE rnk <= 3         
ORDER BY gender, rnk;
