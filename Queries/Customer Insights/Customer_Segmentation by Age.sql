WITH age_buckets AS (
  SELECT
    customer_id,
    CASE
      WHEN age BETWEEN 0  AND 17 THEN '00-17'
      WHEN age BETWEEN 18 AND 25 THEN '18-25'
      WHEN age BETWEEN 26 AND 35 THEN '26-35'
      WHEN age BETWEEN 36 AND 45 THEN '36-45'
      WHEN age BETWEEN 46 AND 55 THEN '46-55'
      WHEN age BETWEEN 56 AND 65 THEN '56-65'
      WHEN age >= 66           THEN '66+'
      ELSE 'Unknown'
    END AS age_group
  FROM customers
)
SELECT
  ab.age_group,
  SUM(s.units_sold) AS total_units
FROM sales s
JOIN age_buckets ab ON s.customer_id = ab.customer_id
GROUP BY ab.age_group
ORDER BY ab.age_group

