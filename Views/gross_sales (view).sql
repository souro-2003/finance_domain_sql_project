CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `gross_sales` AS
    SELECT 
        `s`.`date` AS `date`,
        `g`.`fiscal_year` AS `fiscal_year`,
        `c`.`customer_code` AS `customer_code`,
        `c`.`customer` AS `customer`,
        `c`.`market` AS `market`,
        `d`.`product_code` AS `product_code`,
        `d`.`product` AS `product`,
        `d`.`variant` AS `variant`,
        `s`.`sold_quantity` AS `sold_quantity`,
        `g`.`gross_price` AS `gross_price_per_item`,
        ROUND((`g`.`gross_price` * `s`.`sold_quantity`),
                2) AS `gross_price_total`
    FROM
        (((`fact_sales_monthly` `s`
        JOIN `dim_customer` `c` ON ((`c`.`customer_code` = `s`.`customer_code`)))
        JOIN `fact_gross_price` `g` ON ((`g`.`product_code` = `s`.`product_code`)))
        JOIN `dim_product` `d` ON ((`d`.`product_code` = `g`.`product_code`)))