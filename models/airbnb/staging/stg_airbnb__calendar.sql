with 

source as (

    select * from {{ source('airbnb', 'calendar') }}

),

renamed as (

    select
        listing_id,
        date,
        available,
        price

    from source

)

select * from renamed
