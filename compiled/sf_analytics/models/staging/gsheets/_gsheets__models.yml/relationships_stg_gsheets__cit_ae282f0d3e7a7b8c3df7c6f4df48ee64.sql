
    
    

with child as (
    select country_id as from_field
    from analytics.staging.stg_gsheets__city
    where country_id is not null
),

parent as (
    select country_id as to_field
    from analytics.staging.stg_gsheets__country
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


