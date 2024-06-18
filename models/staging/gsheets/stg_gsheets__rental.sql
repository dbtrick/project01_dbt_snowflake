with 

table_source as (

    select * from {{ source('src_gsheets', 'rental') }}

),

final as (

  select 

    cast(rental_id as int) as rental_id,
    cast(staff_id as int) as staff_id,
    cast(customer_id as int) as customer_id,
    to_timestamp(rental_date, 'YYYY-MM-DD HH24:MI:SS') as rental_date,
    return_date,
    cast(inventory_id as int) as inventory_id,
    to_timestamp(last_update, 'YYYY-MM-DD HH24:MI:SS') as last_update_timestamp

  from table_source

)

select * from final






