
  
    

        create or replace transient table analytics.warehouse.dim_address
         as
        (with

address as (
  select * from analytics.staging.stg_gsheets__address
),

city as (
  select * from analytics.staging.stg_gsheets__city
),

country as (
  select * from analytics.staging.stg_gsheets__country
),

final as (

  select
    md5(cast(coalesce(cast(address.address_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as address_key,

    address.address_id,
    address.address,
    address.postal_code,
    address.address_number,
    address.district,

    city.city,
    country.country

  from address

  left join city 
    on address.city_id = city.city_id
  left join country 
    on city.country_id = country.country_id

)

select * from final
        );
      
  