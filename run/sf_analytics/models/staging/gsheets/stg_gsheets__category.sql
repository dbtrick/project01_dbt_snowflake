
  create or replace   view analytics.staging.stg_gsheets__category
  
   as (
    with 

table_source as (
  select * from raw.raw_google_sheets.category
),

final as (

  select 
    cast(category_id as int) as category_id,
    name as category_name,
    TO_TIMESTAMP(last_update, 'YYYY-MM-DD HH24:MI:SS') AS last_update_timestamp

  from table_source  
)

select * from final
  );

