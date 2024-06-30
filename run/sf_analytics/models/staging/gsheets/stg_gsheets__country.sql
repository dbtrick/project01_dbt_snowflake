
  create or replace   view analytics.staging.stg_gsheets__country
  
   as (
    with 

table_source as (
  select * from raw.raw_google_sheets.country
),

final as (

  select 
    cast(country_id as int) as country_id,
    country,
    to_timestamp(last_update, 'YYYY-MM-DD HH24:MI:SS') as last_update_timestamp

  from table_source
)

select * from final
  );

