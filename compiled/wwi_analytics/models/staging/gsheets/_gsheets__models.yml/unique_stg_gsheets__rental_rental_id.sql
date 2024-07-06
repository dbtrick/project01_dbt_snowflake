
    
    

select
    rental_id as unique_field,
    count(*) as n_records

from analytics.staging.stg_gsheets__rental
where rental_id is not null
group by rental_id
having count(*) > 1


