SELECT 
    *,
    ROUND(purchase_price*quantity, 2) AS purchase_cost,
    ROUND(revenue - purchase_price*quantity, 2) AS sales_margin
FROM
{{ ref('stg_raw__product')}}
INNER JOIN
{{ ref ('stg_raw__sales')}}
USING (products_id)