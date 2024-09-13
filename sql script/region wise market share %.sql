with cte as (select c.customer,c.region,
round(sum(net_sales)/1000000,2) as net_sales_millions
from net_sales as s
join dim_customer as c
on s.customer_code = c.customer_code
where s.fiscal_year = 2021
group by c.customer,c.region)

select *,
net_sales_millions*100/sum(net_sales_millions) over (partition by region) as contribution_pct
from cte
order by region,net_sales_millions desc