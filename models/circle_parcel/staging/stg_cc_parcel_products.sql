select
parcel_id,
model_mame AS model_name,
quantity
FROM
{{ source('circle_raw', 'parcel_product') }}