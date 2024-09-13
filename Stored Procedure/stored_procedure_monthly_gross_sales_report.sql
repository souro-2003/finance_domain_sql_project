CREATE DEFINER=`root`@`localhost` PROCEDURE `get_monthly_gross_sales`(
c_code INT
)
BEGIN
		SELECT YEAR(s.date) as Year,
	MONTHNAME(s.date),
	ROUND(SUM(g.gross_price*s.sold_quantity),2) as Total_gross_price
	FROM fact_sales_monthly as s
	JOIN fact_gross_price as g
	ON g.product_code = s.product_code
	AND g.fiscal_year = get_fiscal_year(s.date)
	WHERE customer_code = c_code
	GROUP BY s.date
	ORDER BY s.date ASC;
END