select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select film_id as from_field
    from analytics.staging.stg_gsheets__inventory
    where film_id is not null
),

parent as (
    select film_id as to_field
    from analytics.staging.stg_gsheets__film
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test