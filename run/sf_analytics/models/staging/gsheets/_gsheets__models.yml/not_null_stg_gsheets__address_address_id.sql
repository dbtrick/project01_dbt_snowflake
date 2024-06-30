select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select address_id
from analytics.staging.stg_gsheets__address
where address_id is null



      
    ) dbt_internal_test