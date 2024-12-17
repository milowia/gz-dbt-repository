with 

source as (

    select * from {{ source('airbnb', 'listing') }}

),

renamed as (

    select
        id AS listing_id,
        room_type,
        host_response_time,
        review_scores_value

    from source

)

select * from renamed
