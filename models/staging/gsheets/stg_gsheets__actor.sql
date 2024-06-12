with

  table_source as (

    select * from {{ source('src_gsheets', 'actor') }}

  ),

  final as (

    select 

        CAST(actor_id AS int) AS actor_id,
        CONCAT(first_name, ' ', last_name) AS actor_full_name,
        TO_TIMESTAMP(last_update, 'YYYY-MM-DD HH24:MI:SS') AS last_update_timestamp
        
    from table_source


  )

  select * from final

