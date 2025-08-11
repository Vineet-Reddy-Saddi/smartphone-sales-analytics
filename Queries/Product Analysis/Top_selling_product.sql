-- Top 5 best-selling smartphone models
SELECT s.product_id, sp.model, SUM(s.units_sold) AS total_units_sold
FROM sales s
JOIN smartphones sp ON s.product_id = sp.product_id
GROUP BY s.product_id, sp.model
ORDER BY total_units_sold DESC
LIMIT 5;
