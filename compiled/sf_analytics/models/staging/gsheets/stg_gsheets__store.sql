with 

table_source as (
  select * from raw.raw_google_sheets.store
),

final as (

  select
    cast(store_id as int) as store_id,
    cast(manager_staff_id as int) as manager_staff_id,
    cast(address_id as int) as address_id,
    to_timestamp(last_update, 'YYYY-MM-DD HH24:MI:SS') as last_update_timestamp

  from table_source
)

select * from final