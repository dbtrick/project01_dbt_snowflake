with 

table_source as (
  select * from {{ source('src_gsheets', 'customer') }}
),

final as (

  select 
    cast(customer_id as int) as customer_id,
    email as customer_email,

    case 
      when active = 1 then 'true'
      when active = 0 then 'false'
      else null
    end as customer_is_active,

    cast(store_id as int) as store_id,
    concat(first_name, ' ', last_name) as customer_name,
    cast(address_id as int) as address_id,
    cast(create_date as date) as create_date,
    to_timestamp(last_update, 'YYYY-MM-DD HH24:MI:SS') as last_update_timestamp
  
  from table_source
)

select * from final