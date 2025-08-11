
WITH product_sales AS (
  SELECT s.product_id, SUM(s.units_sold) AS total_units
  FROM sales s
  GROUP BY s.product_id
),
ranked AS (
  SELECT product_id, total_units,
         DENSE_RANK() OVER (ORDER BY total_units DESC) AS rnk
  FROM product_sales
),
top_sellers AS (
  SELECT product_id, total_units
  FROM ranked
  WHERE rnk <= 10   
),

spec_unpivot AS (
  SELECT 'ram' AS spec, sp.ram AS value, ts.total_units AS weight
  FROM smartphones sp JOIN top_sellers ts ON sp.product_id = ts.product_id
  WHERE sp.ram IS NOT NULL
  UNION ALL
  SELECT 'processor', sp.processor, ts.total_units
  FROM smartphones sp JOIN top_sellers ts ON sp.product_id = ts.product_id
  WHERE sp.processor IS NOT NULL
  UNION ALL
  SELECT 'camera', sp.camera, ts.total_units
  FROM smartphones sp JOIN top_sellers ts ON sp.product_id = ts.product_id
  WHERE sp.camera IS NOT NULL
  UNION ALL
  SELECT 'battery', sp.battery, ts.total_units
  FROM smartphones sp JOIN top_sellers ts ON sp.product_id = ts.product_id
  WHERE sp.battery IS NOT NULL
  UNION ALL
  SELECT 'display', sp.display, ts.total_units
  FROM smartphones sp JOIN top_sellers ts ON sp.product_id = ts.product_id
  WHERE sp.display IS NOT NULL
  UNION ALL
  SELECT 'sim', sp.sim, ts.total_units
  FROM smartphones sp JOIN top_sellers ts ON sp.product_id = ts.product_id
  WHERE sp.sim IS NOT NULL
  UNION ALL
  SELECT 'card', sp.card, ts.total_units
  FROM smartphones sp JOIN top_sellers ts ON sp.product_id = ts.product_id
  WHERE sp.card IS NOT NULL
  UNION ALL
  SELECT 'os', sp.os, ts.total_units
  FROM smartphones sp JOIN top_sellers ts ON sp.product_id = ts.product_id
  WHERE sp.os IS NOT NULL
),

spec_counts AS (
  SELECT spec, value, SUM(weight) AS units_weighted
  FROM spec_unpivot
  GROUP BY spec, value
),

ranked_specs AS (
  SELECT
    spec, value, units_weighted,
    DENSE_RANK() OVER (PARTITION BY spec ORDER BY units_weighted DESC) AS rnk
  FROM spec_counts
)

SELECT spec, value AS most_common_value, units_weighted AS units_for_value
FROM ranked_specs
WHERE rnk = 1
ORDER BY spec;
