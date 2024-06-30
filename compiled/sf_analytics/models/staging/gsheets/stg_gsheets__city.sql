with 

table_source as (
  select * from raw.raw_google_sheets.city
),

final as (

  select 
    cast(city_id as int) as city_id,
    city,
    cast(country_id as int) as country_id,
    TO_TIMESTAMP(last_update, 'YYYY-MM-DD: HH24:MI:SS') AS last_update_timestamp

  from table_source
)

select * from final