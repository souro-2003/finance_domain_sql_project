CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `net_sales` AS
    SELECT 
        `post_invoice_discount`.`date` AS `date`,
        `post_invoice_discount`.`fiscal_year` AS `fiscal_year`,
        `post_invoice_discount`.`customer_code` AS `customer_code`,
        `post_invoice_discount`.`market` AS `market`,
        `post_invoice_discount`.`product_code` AS `product_code`,
        `post_invoice_discount`.`product` AS `product`,
        `post_invoice_discount`.`variant` AS `variant`,
        `post_invoice_discount`.`sold_quantity` AS `sold_quantity`,
        `post_invoice_discount`.`gross_price_total` AS `gross_price_total`,
        `post_invoice_discount`.`pre_invoice_discount_pct` AS `pre_invoice_discount_pct`,
        `post_invoice_discount`.`net_invoice_sales` AS `net_invoice_sales`,
        `post_invoice_discount`.`post_invoice_discounts_pct` AS `post_invoice_discounts_pct`,
        ((1 - `post_invoice_discount`.`post_invoice_discounts_pct`) * `post_invoice_discount`.`net_invoice_sales`) AS `net_sales`
    FROM
        `post_invoice_discount`