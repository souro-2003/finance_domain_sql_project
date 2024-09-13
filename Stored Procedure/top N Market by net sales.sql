CREATE DEFINER=`root`@`localhost` PROCEDURE `top_n_market_by_net_sales`(
input_fiscal_year INT,
input_top_n INT )
BEGIN
select market,
round(sum(net_sales)/1000000,2) as net_sales_million
from net_sales
where fiscal_year = input_fiscal_year
group by market
order by net_sales_million desc
limit input_top_n;
END