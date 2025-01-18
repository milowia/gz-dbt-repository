{{config(materialized='table')}}

SELECT
    listing_id,
    ROUND(AVG(price)) AS avg_price,
    room_type,
    host_response_time,
    review_scores_value,
    COUNTIF(available = true) AS available_days,
    CASE
        WHEN review_scores_value >= 4.5 THEN 'high'
        WHEN review_scores_value <= 4.0 THEN 'low'
        ELSE 'medium'
    END AS review_range,
    ROUND(COUNTIF(available = true)/COUNT(DISTINCT (date)),2) AS availability_rate,
    ROUND(1-COUNTIF(available = true)/COUNT(DISTINCT (date)),2) AS booking_rate
FROM {{ref('stg_airbnb')}}
GROUP BY listing_id, room_type, host_response_time, review_scores_value
ORDER BY COUNTIF(available = true) DESC