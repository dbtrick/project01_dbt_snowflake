select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select staff_id
from analytics.staging.stg_gsheets__payment
where staff_id is null



      
    ) dbt_internal_test