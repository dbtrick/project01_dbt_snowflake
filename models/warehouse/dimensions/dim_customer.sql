with 

customer  as (

  select * from {{ ref('stg_gsheets__customer' )}}

),

address as (

  select * from {{ ref('stg_gsheets__address') }}

),

city as (

  select * from {{ ref('stg_gsheets__city') }}

),

country as (

  select * from {{ ref('stg_gsheets__country') }}

),

final as (

  select 

    stg_gsheets__customer.customer_id,
    stg_gsheets__customer.customer_email,
    stg_gsheets__customer.customer_name,
    stg_gsheets__customer.customer_is_active,

    stg_gsheets__address.address,
    stg_gsheets__address.postal_code,
    stg_gsheets__address.address_number,
    stg_gsheets__address.district,

    stg_gsheets__city.city,
    stg_gsheets__country.country

  from {{ ref('stg_gsheets__customer' )}}
  
  left join {{ ref('stg_gsheets__address') }} on stg_gsheets__customer.address_id = stg_gsheets__address.address_id
  left join {{ ref('stg_gsheets__city') }} on stg_gsheets__address.city_id = stg_gsheets__city.city_id
  left join {{ ref('stg_gsheets__country') }} on stg_gsheets__city.country_id = stg_gsheets__country.country_id

)

select * from final 

