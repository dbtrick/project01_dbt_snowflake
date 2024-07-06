with 

table_source as (
  select * from raw.gsheets.category
),

final as (

  select 
    cast(category_id as int) as category_id,
    name as category_name,
    TO_TIMESTAMP(last_update, 'YYYY-MM-DD HH24:MI:SS') AS last_update_timestamp

  from table_source  
)

select * from final