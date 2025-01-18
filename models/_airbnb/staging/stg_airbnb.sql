SELECT *
FROM {{ref('stg_airbnb__calendar')}}
INNER JOIN {{ref('stg_airbnb__listing')}}
USING (listing_id)
