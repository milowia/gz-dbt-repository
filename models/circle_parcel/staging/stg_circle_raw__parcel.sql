with 

source as (

    select * from {{ source('circle_raw', 'parcel') }}

),

renamed as (

    select
        parcel_id,
        parcel_tracking,
        transporter,
        priority,
        CAST(date_purchase AS DATE FORMAT 'MONTH DD, YYYY') AS date_purchase,
        CAST(date_shipping AS DATE FORMAT 'MONTH DD, YYYY') AS date_shipping,
        CAST(date_delivery AS DATE FORMAT 'MONTH DD, YYYY') AS date_delivery,
        CAST(datecancelled AS DATE FORMAT 'MONTH DD, YYYY') AS date_cancelled

    from source

)

select * from renamed
