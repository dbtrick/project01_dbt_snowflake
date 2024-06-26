with 

fct_payment as (
  select * from {{ ref('fct_payment') }}
),

final as (

  select
    fct_payment.rental_id,

    sum(amount) as total_amount,
    avg(amount) as average_amount,
    min(amount) as minimum_amount,
    max(amount) as maximum_amount,
    count(payment_id) as total_payments

  from fct_payment
  group by rental_id
)

select * from final