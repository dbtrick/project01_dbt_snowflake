
  create or replace   view analytics.staging.stg_gsheets__inventory
  
   as (
    with

table_source as (
  select * from raw.raw_google_sheets.inventory
),

final as (

  select 
    cast(inventory_id as int) as inventory_id,
    cast(film_id as int) as film_id,
    cast(store_id as int) as store_id,
    to_timestamp(last_update, 'YYYY-MM-DD HH24:MI:SS') as last_update_timestamp

  from table_source
)

select * from final
  );

