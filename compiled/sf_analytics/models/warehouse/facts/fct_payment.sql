with

payment as (
  select * from analytics.staging.stg_gsheets__payment
),

staff as (
  select * from analytics.warehouse.dim_staff
),

rental as (
  select * from analytics.warehouse.dim_rental
),

customer as (
  select * from analytics.warehouse.dim_customer
),

final as (

  select 
    md5(cast(coalesce(cast(payment.payment_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(staff.staff_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(rental.rental_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(customer.customer_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as payment_key,

    payment.payment_id,
    staff.staff_id,
    rental.rental_id,
    customer.customer_id,

    amount,
    payment_date

  from payment

  left join staff 
    on payment.staff_id = staff.staff_id
  left join rental 
    on payment.rental_id = rental.rental_id
  left join customer 
    on payment.customer_id = customer.customer_id
)

select * from final