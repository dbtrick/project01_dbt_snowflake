
  create or replace   view analytics.staging.stg_gsheets__film_actor
  
   as (
    with 

table_source as (
  select * from raw.raw_google_sheets.film_actor
),

final as (

  select 
    cast(film_id as int) as film_id,
    cast(actor_id as int) as actor_id,
    to_timestamp(last_update, 'YYYY-MM-DD HH24:MI:SS') as last_update_timestamp
  
  from table_source
)

select * from final
  );

