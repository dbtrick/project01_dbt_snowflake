select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select rental_id as from_field
    from analytics.staging.stg_gsheets__payment
    where rental_id is not null
),

parent as (
    select rental_id as to_field
    from analytics.staging.stg_gsheets__rental
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test