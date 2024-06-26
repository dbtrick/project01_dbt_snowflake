with

fct_payment as (
  select * from {{ ref('fct_payment') }}
),

dim_staff as (
  select * from {{ ref('dim_staff') }}
),

dim_rental as (
  select * from {{ ref('dim_rental') }}
),

dim_customer as (
  select * from {{ ref('dim_customer') }}
),

dim_address as (
  select * from {{ ref('dim_address')}}
),

stg_address as (
  select * from {{ ref('stg_gsheets__address') }}
),

stg_city as (
  select * from {{ ref('stg_gsheets__city') }}
),

stg_country as (
  select * from {{ ref('stg_gsheets__country') }}
),

final as (

  select
    fct_payment.payment_id,
    dim_rental.rental_id,

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
    on fct_payment.customer_id = dim_customer.customer_id
  left join dim_staff
    on fct_payment.staff_id = dim_staff.staff_id
  left join dim_rental
    on fct_payment.rental_id = dim_rental.rental_id
)

select * from final