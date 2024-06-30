
  create or replace   view analytics.staging.stg_gsheets__language
  
   as (
    with 

table_source as (
  select * from raw.raw_google_sheets.language
),

final as (

  select
    cast(language_id as int) as language_id,
    name as language_name,
    to_timestamp(last_update, 'YYYY-MM-DD HH24:MI:SS') as last_update_timestamp

  from table_source
)

select * from final
  );

