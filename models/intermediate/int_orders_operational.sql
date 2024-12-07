SELECT
    *,
    ROUND(orders_margin + shipping_fee - logcost - ship_cost, 2) AS opperational_margin
FROM
{{ ref('int_orders_margin')}}
INNER JOIN
{{ ref('stg_raw__ship')}}
USING (orders_id)