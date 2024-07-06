with 

fct_payment as (
  select * from analytics.warehouse.fct_payment
),

final as (

  select
    fct_payment.rental_key,

    sum(amount) as total_amount,
    avg(amount) as average_amount,
    min(amount) as minimum_amount,
    max(amount) as maximum_amount,
    count(rental_key) as total_payments

  from fct_payment
  group by rental_key
)

select * from final