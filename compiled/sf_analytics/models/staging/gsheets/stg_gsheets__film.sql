with

table_source as (
  select * from raw.raw_google_sheets.film
),

final as (

  select 
    cast(film_id as int) as film_id,
    title as film_title,
    cast(length as int) as film_length,
    rating as film_rating,
    fulltext,
    description as film_description,
    to_number(rental_rate, 10, 2) as rental_rate,
    cast(release_year as int) as release_year,
    cast(rental_duration as int) as rental_duration,
    to_number(replacement_cost, 10, 2) as replacement_cost,
    special_features,
    to_timestamp(last_update, 'YYYY-MM-DD HH24:MI:SS') as last_update_timestamp

  from table_source
)

select * from final