-- select channel,sum(price*units_sold) as total_sales_per_region
-- from sales
-- group by channel
-- order by total_sales_per_region Desc

SELECT channel, SUM(units_sold) AS total_units
FROM sales
GROUP BY channel
ORDER BY total_units DESC;

