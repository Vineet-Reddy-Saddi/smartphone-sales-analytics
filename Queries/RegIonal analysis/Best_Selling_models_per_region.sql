-- WITH best_selling AS (
--     SELECT
--         s.region,
--         sp.model,
--         SUM(s.units_sold * s.price) AS total_sales_value
--     FROM sales s
--     JOIN smartphones sp ON s.product_id = sp.product_id
--     GROUP BY s.region, sp.model
-- )
-- , ranked AS (
--     SELECT
--         region,
--         model,
--         total_sales_value,
--         DENSE_RANK() OVER (PARTITION BY region ORDER BY total_sales_value DESC) AS rnk
--     FROM best_selling
-- )
-- SELECT region, model
-- FROM ranked
-- WHERE rnk = 1;

WITH best_selling AS (
    SELECT
        s.region,
        sp.model,
        SUM(s.units_sold) AS total_units
    FROM sales s
    JOIN smartphones sp ON s.product_id = sp.product_id
    GROUP BY s.region, sp.model
)
, ranked AS (
    SELECT
        region,
        model,
        total_units,
        DENSE_RANK() OVER (PARTITION BY region ORDER BY total_units DESC) AS rnk
    FROM best_selling
)
SELECT region, model, total_units
FROM ranked
WHERE rnk = 1;
