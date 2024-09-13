-- Generate a yearly report for Croma India where there are two columns

-- 1. Fiscal Year
-- 2. Total Gross Sales amount In that year from Croma

SELECT 
    get_fiscal_year(date) AS Fiscal_year,
    ROUND(SUM(g.gross_price*sold_quantity),2) as Total_gross_sales_amount
FROM
    fact_sales_monthly AS s
        JOIN
    fact_gross_price AS g ON g.product_code = s.product_code
        AND g.fiscal_year = GET_FISCAL_YEAR(s.date)
WHERE
    customer_code = 90002002
GROUP BY get_fiscal_year(date)
ORDER BY Fiscal_year ASC