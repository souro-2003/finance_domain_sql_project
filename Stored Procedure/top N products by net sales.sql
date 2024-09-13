CREATE DEFINER=`root`@`localhost` PROCEDURE `top_n_products_by_net_sales`(
input_fiscal_year int,
input_top_n int
)
BEGIN
	select product,
	round(sum(net_sales)/1000000,2) as net_sales_millions
	from net_sales
    where fiscal_year = input_fiscal_year
	group by product
	order by net_sales_millions desc
    limit input_top_n;
END