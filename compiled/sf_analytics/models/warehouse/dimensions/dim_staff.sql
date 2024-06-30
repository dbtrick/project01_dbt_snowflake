with

staff as (
  select * from analytics.staging.stg_gsheets__staff
),

address as (
  select * from analytics.staging.stg_gsheets__address
),

store as (
  select * from analytics.staging.stg_gsheets__store
),

final as (

  select
    md5(cast(coalesce(cast(staff.staff_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as staff_key,

    staff.staff_id,
    staff.email,
    staff.password,
    staff.staff_fullname,
    staff.username,
    
    staff_address.address as staff_address,
    store_address.address as store_address

  from staff

  left join address as staff_address 
    on staff.address_id = staff_address.address_id
  left join store 
    on staff.store_id = store.store_id
  left join address as store_address 
    on store.address_id = store_address.address_id

)

select * from final