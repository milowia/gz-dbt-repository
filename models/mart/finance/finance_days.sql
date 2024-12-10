SELECT
    date_date,
    COUNT(orders_id) AS daily_n_transactions,
    ROUND(SUM(revenue), 2) AS daily_revenue,
    ROUND(SUM(orders_margin), 2) AS daily_margin,
    ROUND(SUM(revenue)/COUNT(orders_id), 3) AS avereage_basket,
    ROUND(SUM(opperational_margin), 2) AS daily_operational_margin,
    ROUND(SUM(purchase_cost), 2) AS daily_purchase_cost,
    ROUND(SUM(shipping_fee), 2) AS daily_shipping_fee,
    ROUND(SUM(logcost), 2) AS daily_log_cost,
    SUM(quantity_product) AS quantity_product
FROM
{{ ref("int_orders_operational") }}
GROUP BY date_date
ORDER BY date_date DESC