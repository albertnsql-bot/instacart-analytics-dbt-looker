{{ config(materialized='table') }}

with first_orders as (

    select
        customer_id,
        min(order_date) as first_order_date
    from {{ ref('fact_orders') }}
    group by customer_id

),

orders as (

    select
        o.customer_id,
        o.order_date,
        date_trunc(month, f.first_order_date) as cohort_month,
        date_trunc(month, o.order_date) as order_month
    from {{ ref('fact_orders') }} o
    join first_orders f
        on o.customer_id = f.customer_id

)

select
    cohort_month,
    order_month,
    datediff(month, cohort_month, order_month) as cohort_index,
    count(distinct customer_id) as active_customers
from orders
group by 1,2,3
order by 1,2