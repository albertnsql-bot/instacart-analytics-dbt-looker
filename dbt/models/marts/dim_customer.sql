{{ config(materialized='table') }}

with customer_orders as (

    select
        customer_id,
        order_date
    from {{ ref('int_orders_enriched') }}

),

aggregated as (

    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as last_order_date,
        count(*) as total_orders,
        datediff(day, min(order_date), max(order_date)) as customer_lifetime_days
    from customer_orders
    group by customer_id

)

select *
from aggregated