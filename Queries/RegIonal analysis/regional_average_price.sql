select region,avg(price)
from sales
group by region
order by avg(price) Desc