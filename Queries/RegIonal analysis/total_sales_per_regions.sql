select region,sum(price*units_sold) as total_sales_per_region
from sales
group by region
order by total_sales_per_region Desc