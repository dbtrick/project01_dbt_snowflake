with

table_source as (
  select * from {{ source('src_gsheets', 'staff') }}
),

final as (

  select 
    cast(staff_id as int) as staff_id,
    email,
    password,
    concat(first_name, ' ', last_name) as staff_fullname,
    username,
    active,
    picture,
    cast(store_id as int) as store_id,
    cast(address_id as int) as address_id,
    last_update

  from table_source
)

select * from final