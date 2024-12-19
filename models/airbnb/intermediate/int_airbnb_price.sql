{{config(materialized='table')}}

SELECT
    *
    , CASE
        WHEN price >= 1500 THEN 'luxury'
        WHEN price <= 50 THEN 'cheap'
        WHEN price BETWEEN 500 AND 1500 THEN 'expensive'
        ELSE 'afordable'
    END AS price_range
    IF(available = true) AS available
FROM {{ref('stg_airbnb')}}
