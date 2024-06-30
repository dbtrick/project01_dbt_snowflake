
    
    

with child as (
    select city_id as from_field
    from analytics.staging.stg_gsheets__address
    where city_id is not null
),

parent as (
    select city_id as to_field
    from analytics.staging.stg_gsheets__city
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


