CREATE DEFINER=`root`@`localhost` PROCEDURE `get_market_badge`(
input_market varchar(20),
input_fiscal_year YEAR)
BEGIN

# If anyone does not put market then the default market should be India
IF input_market = " " THEN 
SET input_market = "India";
END IF ;

	SELECT 
    d.market,
	CASE WHEN SUM(sold_quantity) > 5000000 THEN "Gold"
	ELSE "Silver"
	END AS Market_Badge
	FROM dim_customer AS d
	JOIN fact_sales_monthly as s
	ON d.customer_code = s.customer_code
    WHERE d.market = input_market AND get_fiscal_year(s.date)= input_fiscal_year
	GROUP BY d.market;
END