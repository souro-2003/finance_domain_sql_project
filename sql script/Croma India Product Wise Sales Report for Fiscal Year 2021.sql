-- Croma India Product Wise Sales Report for Fiscal Year 2021

SELECT 
    s.date,
    s.product_code,
    p.product,
    p.variant,
    s.sold_quantity,
    g.gross_price,
    round((g.gross_price*s.sold_quantity),2) as gross_price_total
FROM
    fact_sales_monthly AS s
        JOIN
    dim_product AS p ON p.product_code = s.product_code
        JOIN
    fact_gross_price AS g ON g.product_code = s.product_code
        AND GET_FISCAL_YEAR(s.date)
WHERE
    customer_code = 90002002
        AND GET_FISCAL_YEAR(date) = 2021
ORDER BY date DESC;