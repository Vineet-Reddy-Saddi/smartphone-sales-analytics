SELECT
  c.gender,
  SUM(s.units_sold) AS total_units
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.gender
ORDER BY total_units DESC;
