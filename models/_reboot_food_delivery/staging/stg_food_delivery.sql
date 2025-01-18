with 

source as (

    select * from {{ source('food_delivery', 'food_delivery_raw') }}

),

renamed as (

    select
        random_id,
        customer_gender,
        id_order,
        merchant_name,
        order_date,
        order_time,
        order_total_paid,
        order_currency,
        payment_method_name,
        order_delivery_fee,
        order_processing_fee,
        order_total_fees,
        order_total_promo,
        seller_name,
        seller_category_name,
        order_item_delivery_address_region,
        order_item_delivery_address_subregion,
        order_item_delivery_address_city

    from source

)

select * from renamed
