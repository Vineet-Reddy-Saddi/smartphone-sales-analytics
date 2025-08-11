WITH model_by_demo AS (
  SELECT c.gender, c.income_bracket, sp.model, SUM(s.units_sold) AS units
  FROM sales s
  JOIN customers c ON s.customer_id = c.customer_id
  JOIN smartphones sp ON s.product_id = sp.product_id
  GROUP BY c.gender, c.income_bracket, sp.model
),
model_tot AS (
  SELECT model, SUM(units) AS model_units
  FROM model_by_demo
  GROUP BY model
),
scored AS (
  SELECT
    m.model,
    m.gender,
    m.income_bracket,
    m.units,
    ROUND(100.0 * m.units / mt.model_units, 2) AS pct_of_model
  FROM model_by_demo m
  JOIN model_tot mt USING (model)
)
SELECT *
FROM (
  SELECT
    model, gender, income_bracket, units, pct_of_model,
    ROW_NUMBER() OVER (PARTITION BY model ORDER BY pct_of_model DESC, units DESC) AS rn
  FROM scored
) x
WHERE rn = 1     
ORDER BY pct_of_model DESC;
