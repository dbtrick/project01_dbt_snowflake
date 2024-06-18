with

address as (

  select * from {{ ref('stg_gsheets__address') }}

),

city as (

  select * from {{ ref('stg_gsheets__city') }}

),

country as (

  select * from {{ ref('stg_gsheets__country')}}
),

final as (

  select

    {{ dbt_utils.generate_surrogate_key(['address.address_id']) }} as address_key,

    address.address_id,
    address.address,
    address.postal_code,
    address.address_number,
    address.district,

    city.city,
    country.country

  from address

  left join city on address.city_id = city.city_id
  left join country on city.country_id = country.country_id

)

select * from final