{{config(materialized='table')}}

SELECT
    *
    , CASE
        WHEN review_scores_value >= 4.5 THEN 'high'
        WHEN review_scores_value <= 4.0 THEN 'low'
        ELSE 'medium'
    END AS review_range
    , IF(available, 0, 1) AS booked
FROM {{ref('stg_airbnb')}}