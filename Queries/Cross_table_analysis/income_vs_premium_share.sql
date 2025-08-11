WITH joined AS (
  SELECT
    c.income_bracket,
    s.units_sold,
    sp.price
  FROM sales s
  JOIN customers c  ON s.customer_id = c.customer_id
  JOIN smartphones sp ON s.product_id = sp.product_id
),
flagged AS (
  SELECT
    income_bracket,
    units_sold,
    (price >= 50000)::int AS is_premium   
  FROM joined
)
SELECT
  income_bracket,
  SUM(units_sold) AS total_units,
  ROUND(100.0 * SUM(units_sold * is_premium) / NULLIF(SUM(units_sold), 0), 2) AS premium_share_pct
FROM flagged
GROUP BY income_bracket
ORDER BY premium_share_pct DESC;
