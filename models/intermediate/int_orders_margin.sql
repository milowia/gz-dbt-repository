SELECT
    date_date,
    orders_id,
    ROUND(SUM(quantity)) AS quantity_product,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(purchase_cost), 2) AS purchase_cost,
    ROUND(SUM(sales_margin), 2) AS orders_margin
FROM
{{ ref('int_sales_margin')}}
GROUP BY orders_id, date_date
ORDER BY orders_id DESC