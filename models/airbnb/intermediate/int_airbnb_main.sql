SELECT
    listing_id,
    ROUND(AVG(price)) AS avg_price,
    room_type,
    host_response_time,
    review_scores_value
FROM {{ref('stg_airbnb')}}
GROUP BY listing_id, room_type, host_response_time, review_scores_value
