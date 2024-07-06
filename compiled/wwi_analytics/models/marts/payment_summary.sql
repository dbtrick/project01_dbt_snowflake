with

fct_payment as (
  select * from analytics.warehouse.fct_payment
),

dim_staff as (
  select * from analytics.warehouse.dim_staff
),

dim_rental as (
  select * from analytics.warehouse.dim_rental
),

dim_customer as (
  select * from analytics.warehouse.dim_customer
),

final as (

  select
    fct_payment.payment_key,
    dim_rental.rental_key,

    dim_customer.customer_name,
    dim_customer.customer_email,
    dim_customer.customer_is_active,
    dim_customer.address as customer_address,
    dim_customer.postal_code,
    dim_customer.address_number,
    dim_customer.district,
    dim_customer.city,
    dim_customer.country,
  
    dim_staff.staff_fullname,
    dim_staff.username,
    dim_staff.email,
    dim_staff.password,
    dim_staff.staff_address,
    dim_staff.store_address,

    dim_rental.rental_date,
    dim_rental.return_date,
    dim_rental.film_id,

    fct_payment.amount,
    fct_payment.payment_date

  from fct_payment

  left join dim_customer
    on fct_payment.customer_key = dim_customer.customer_key
  left join dim_staff
    on fct_payment.staff_key = dim_staff.staff_key
  left join dim_rental
    on fct_payment.rental_key = dim_rental.rental_key
)

select * from final