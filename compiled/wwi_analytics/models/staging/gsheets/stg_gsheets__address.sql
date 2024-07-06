with

table_source as (
  select * from raw.gsheets.address
),

final as (

  select 
    cast(address_id as int) as address_id,
    address as address,
    cast(city_id as int) as city_id,
    cast(postal_code as int) as postal_code,
    cast(phone as int) as address_number,
    district,
    TO_TIMESTAMP(last_update, 'YYYY-MM-DD HH24:MI:SS') AS last_update_timestamp

  from table_source
)

select * from final