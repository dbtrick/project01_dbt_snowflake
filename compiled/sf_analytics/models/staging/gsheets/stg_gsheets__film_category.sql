with 

table_source as (
  select * from raw.raw_google_sheets.film_category
),

final as (

  select 
    cast(film_id as int) as film_id,
    cast(category_id as int) as category_id,
    to_timestamp(last_update, 'YYYY-MM-DD HH24:MI:SS') as last_update_timestamp

  from table_source
)

select * from final