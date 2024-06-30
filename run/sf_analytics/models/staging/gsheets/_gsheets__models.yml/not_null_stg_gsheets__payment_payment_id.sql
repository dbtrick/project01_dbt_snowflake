select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select payment_id
from analytics.staging.stg_gsheets__payment
where payment_id is null



      
    ) dbt_internal_test