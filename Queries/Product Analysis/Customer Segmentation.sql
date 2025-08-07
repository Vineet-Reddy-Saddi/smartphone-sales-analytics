SELECT
    price_segment,
    SUM(units_sold) AS total_units_sold
FROM (
    SELECT
        sales.units_sold,
        CASE
            WHEN smartphones.price < 15000 THEN 'Low'
            WHEN smartphones.price>50000 THEN 'High'
            ELSE 'Mid'
        END AS price_segment
    FROM sales
    JOIN smartphones ON sales.product_id = smartphones.product_id
) AS sub
GROUP BY price_segment
ORDER BY total_units_sold DESC;
