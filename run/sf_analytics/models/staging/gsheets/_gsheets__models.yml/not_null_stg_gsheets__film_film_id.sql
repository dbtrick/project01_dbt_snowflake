select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select film_id
from analytics.staging.stg_gsheets__film
where film_id is null



      
    ) dbt_internal_test