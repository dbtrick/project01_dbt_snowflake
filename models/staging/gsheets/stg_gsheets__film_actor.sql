with 

table_source as (
  select * from {{ source('src_gsheets', 'film_actor') }}
),

final as (

  select 
    cast(film_id as int) as film_id,
    cast(actor_id as int) as actor_id,
    to_timestamp(last_update, 'YYYY-MM-DD HH24:MI:SS') as last_update_timestamp
  
  from table_source
)

select * from final

