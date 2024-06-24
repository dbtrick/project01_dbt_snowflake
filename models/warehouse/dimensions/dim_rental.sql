with

rental as (
  select * from {{ ref('stg_gsheets__rental') }}
),

inventory as (
  select * from {{ ref('stg_gsheets__inventory') }}
), 

customer as (
  select * from {{ ref('stg_gsheets__customer') }}
),

staff as (
  select * from {{ ref('stg_gsheets__staff') }}
),

final as (
  select
    {{ dbt_utils.generate_surrogate_key(['rental.rental_id']) }} as rental_key,

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
