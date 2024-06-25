with

payment as (
  select * from {{ ref('stg_gsheets__payment') }}
),

staff as (
  select * from {{ ref('dim_staff') }}
),

rental as (
  select * from {{ ref('dim_rental') }}
),

customer as (
  select * from {{ ref('dim_customer') }}
),

final as (

  select 
    {{ dbt_utils.generate_surrogate_key([
            'payment.payment_id', 
            'staff.staff_id', 
            'rental.rental_id', 
            'customer.customer_id'
        ]) }} as payment_key,

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


