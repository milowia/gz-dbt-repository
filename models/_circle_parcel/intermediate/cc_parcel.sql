WITH nb_products_subquery AS
    (SELECT 
        parcel_id,
        COUNT(model_name) AS nb_model,
        SUM(quantity) AS quantity
    FROM {{ref('stg_cc_parcel_products')}}
    GROUP BY parcel_id)
SELECT
    parcel_id,
    nb_model,
    quantity,
    parcel_tracking,
    transporter,
    priority,
    CASE 
        WHEN date_cancelled IS NOT NULL THEN 'cancelled'
        WHEN date_delivery IS  NOT NULL AND date_cancelled IS NULL THEN 'delivered'
        WHEN date_shipping IS NOT NULL AND date_delivery IS NULL THEN 'in_transit'
        ELSE 'in_progress'
        END AS parcel_status,
    DATE_DIFF(date_shipping, date_purchase, DAY) AS expedition_day,
    DATE_DIFF(date_delivery, date_shipping, DAY) AS transportation_day,
    DATE_DIFF(date_delivery, date_purchase, DAY) AS delivery_day,
    IF(date_delivery IS NULL, NULL, IF(DATE_DIFF (date_delivery, date_purchase, DAY) > 5, 1, 0)) AS is_delay
FROM {{ ref ('stg_circle_raw__parcel')}}
INNER JOIN nb_products_subquery
USING(parcel_id)
    