{{ config(materialized='table') }}

with base as (

    select
        customer_id,
        max(order_date) as last_order_date,
        count(order_id) as frequency,
        sum(order_revenue) as monetary
    from {{ ref('fact_orders') }}
    group by customer_id

),

recency_calc as (

    select
        *,
        datediff(day, last_order_date, current_date()) as recency
    from base

)

select *
from recency_calc