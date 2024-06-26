with

film_actor as (
  select * from {{ ref('stg_gsheets__film_actor') }}
),

film as (
  select * from {{ ref('stg_gsheets__film') }}
),

actor as (
  select * from {{ ref('stg_gsheets__actor') }}
),

final as (

  select
    {{ dbt_utils.generate_surrogate_key(['film.film_id']) }} as film_key, 

    film.film_id,
    film.film_title,
    film.film_description,
    film.film_length,
    film.film_rating,
    film.release_year,
    film.rental_rate,
    film.rental_duration,
    film.replacement_cost,

    actor.actor_full_name

  from film_actor

  left join film 
    on film_actor.film_id = film.film_id
  left join actor 
    on film_actor.actor_id = actor.actor_id

)

select * from final