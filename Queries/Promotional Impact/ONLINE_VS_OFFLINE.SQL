with retail as (select region,sum(units_sold) as Offline
from sales
where promotion_type is null
group by region),
promo as (SELECT region,sum(units_sold) as Online
from sales
where promotion_type is not null 
group by region)

select retail.region, retail.offline,promo.Online
from retail 
join promo on retail.region=promo.region
order by retail.region ASC