SELECT 
    *,
    ROUND(purchase_price*quantity, 2) AS purchase_cost,
    ROUND(revenue - purchase_price*quantity, 2) AS sales_margin,
    {{ margin_percent ('revenue - purchase_price*quantity', 'revenue', '3') }} AS margin_percent
FROM
{{ ref('stg_raw__product')}}
INNER JOIN
{{ ref ('stg_raw__sales')}}
USING (products_id)