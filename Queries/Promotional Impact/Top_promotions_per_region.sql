WITH best_selling AS (
    SELECT
        s.region,
        s.promotion_type,
        SUM(s.units_sold) AS total_units
    FROM sales s
    where s.promotion_type is not NULL
    GROUP BY s.region, s.promotion_type
)
, ranked AS (
    SELECT
        region,
        promotion_type,
        total_units,
        DENSE_RANK() OVER (PARTITION BY region ORDER BY total_units DESC) AS rnk
    FROM best_selling
)
SELECT region, promotion_type, total_units
FROM ranked
WHERE rnk = 1;