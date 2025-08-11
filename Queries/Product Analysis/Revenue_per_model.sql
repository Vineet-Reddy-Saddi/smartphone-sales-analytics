select sp.model,sum(s.units_sold*s.price) as Total_Revenue
from smartphones sp
join sales s using(product_id)
group by sp.model
order by Total_Revenue Desc