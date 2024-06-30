
  
    

        create or replace transient table analytics.warehouse.dim_rental
         as
        (with

rental as (
  select * from analytics.staging.stg_gsheets__rental
),

inventory as (
  select * from analytics.staging.stg_gsheets__inventory
), 

customer as (
  select * from analytics.staging.stg_gsheets__customer
),

staff as (
  select * from analytics.staging.stg_gsheets__staff
),

final as (
  select
    md5(cast(coalesce(cast(rental.rental_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as rental_key,

    rental.rental_id,
    rental.staff_id,
    staff.staff_fullname,
    rental.customer_id,
    customer.customer_name,
    rental.rental_date,
    rental.return_date,
    rental.inventory_id,
    inventory.film_id

  from rental

  left join staff 
    on rental.staff_id = staff.staff_id
  left join customer 
    on rental.customer_id = customer.customer_id
  left join inventory 
    on rental.inventory_id = inventory.inventory_id
)

select * from final
        );
      
  