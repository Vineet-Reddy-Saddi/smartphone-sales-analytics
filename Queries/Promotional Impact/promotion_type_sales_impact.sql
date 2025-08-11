select COALESCE(promotion_type,'None'),SUM(units_sold) AS units_sold
from sales
group by promotion_type
order by units_sold Desc