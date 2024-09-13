with cte1 as (
select customer,
round(sum(net_sales)/1000000,2) as net_Sales_millions
from net_sales as s
join dim_customer as c
on s.customer_code = c.customer_code
where s.fiscal_year = 2021
group by customer)

select customer,
net_sales_millions,
net_sales_millions*100/sum(net_sales_millions) over() as contribution_pct
from cte1
group by customer
order by net_sales_millions desc
limit 10;