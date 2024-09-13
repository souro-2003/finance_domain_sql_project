CREATE DEFINER=`root`@`localhost` PROCEDURE `top_n_customer_by_net_Sales`(
input_market varchar(45),
input_fiscal_year INT,
input_top_n INT)
BEGIN
	select c.customer,
	round(sum(net_sales)/1000000,2) as net_sales_millions
	from net_sales as s
	join dim_customer as c
	on s.customer_code = c.customer_code
    where fiscal_year = input_fiscal_year and s.market = input_market
	group by c.customer
	order by net_sales_millions desc
    limit input_top_n;
END