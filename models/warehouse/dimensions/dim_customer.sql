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

    {{ dbt_utils.generate_surrogate_key(['customer.customer_id']) }} as customer_key,

    customer.customer_id,
    customer.customer_email,
    customer.customer_name,
    customer.customer_is_active,

    address.address,
    address.postal_code,
    address.address_number,
    address.district,

    city.city,
    country.country

  from customer
  
  left join address on customer.address_id = address.address_id
  left join city on address.city_id = city.city_id
  left join country on city.country_id = country.country_id

)

select * from final 

