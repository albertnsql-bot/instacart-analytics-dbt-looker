{{ config(materialized='table') }}

with date_spine as (

    select
        dateadd(day, seq4(), '2015-01-01') as date_day
    from table(generator(rowcount => 5000))

)

select
    date_day,
    year(date_day) as year,
    month(date_day) as month,
    day(date_day) as day,
    week(date_day) as week,
    dayofweek(date_day) as day_of_week,
    case 
        when dayofweek(date_day) in (1,7) then true
        else false
    end as is_weekend
from date_spine
where date_day <= current_date()