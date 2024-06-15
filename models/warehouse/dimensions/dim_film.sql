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

    {{ dbt_utils.generate_surrogate_key(['stg_gsheets__film.film_id']) }} as film_key, 

    stg_gsheets__film.film_id,
    stg_gsheets__film.film_title,
    stg_gsheets__film.film_description,
    stg_gsheets__film.film_length,
    stg_gsheets__film.film_rating,
    stg_gsheets__film.release_year,
    stg_gsheets__film.rental_rate,
    stg_gsheets__film.rental_duration,
    stg_gsheets__film.replacement_cost,

    stg_gsheets__actor.actor_full_name

  from {{ ref('stg_gsheets__film_actor') }}

  left join {{ ref('stg_gsheets__film') }} on stg_gsheets__film_actor.film_id = stg_gsheets__film.film_id
  left join {{ ref('stg_gsheets__actor') }} on stg_gsheets__film_actor.actor_id = stg_gsheets__actor.actor_id

)

select * from final