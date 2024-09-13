CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `post_invoice_discount` AS
    SELECT 
        `pre`.`date` AS `date`,
        `pre`.`fiscal_year` AS `fiscal_year`,
        `pre`.`customer_code` AS `customer_code`,
        `pre`.`market` AS `market`,
        `pre`.`product_code` AS `product_code`,
        `pre`.`product` AS `product`,
        `pre`.`variant` AS `variant`,
        `pre`.`sold_quantity` AS `sold_quantity`,
        `pre`.`gross_price_total` AS `gross_price_total`,
        `pre`.`pre_invoice_discount_pct` AS `pre_invoice_discount_pct`,
        (`pre`.`gross_price_total` - (`pre`.`gross_price_total` * `pre`.`pre_invoice_discount_pct`)) AS `net_invoice_sales`,
        (`po`.`discounts_pct` + `po`.`other_deductions_pct`) AS `post_invoice_discounts_pct`
    FROM
        (`pre_invoice_discount` `pre`
        JOIN `fact_post_invoice_deductions` `po` ON (((`po`.`date` = `pre`.`date`)
            AND (`po`.`product_code` = `pre`.`product_code`)
            AND (`po`.`customer_code` = `pre`.`customer_code`))))