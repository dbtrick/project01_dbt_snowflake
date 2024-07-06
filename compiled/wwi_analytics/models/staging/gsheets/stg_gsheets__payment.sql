with 

table_source as (
  select * from raw.gsheets.payment
),

final as (

  select 
    cast(payment_id as int) as payment_id,
    cast(staff_id as int) as staff_id,
    cast(rental_id as int) as rental_id,
    cast(customer_id as int) as customer_id,
    to_number(amount, 10, 2) as amount,
    to_timestamp(payment_date, 'YYYY-MM-DD HH24:MI:SS') as payment_date

  from table_source

)

select * from final