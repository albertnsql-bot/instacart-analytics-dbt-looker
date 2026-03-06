{{ config(materialized='table') }}

with base as (

    select
        f.product_id,
        f.order_id,
        f.customer_id,
        f.revenue,
        f.margin,
        f.reordered
    from {{ ref('fact_order_items') }} f

),

aggregated as (

    select
        product_id,
        count(distinct order_id) as total_orders,
        count(distinct customer_id) as unique_customers,
        sum(revenue) as total_revenue,
        sum(margin) as total_margin,
        avg(revenue) as avg_price,
        avg(case when reordered = 1 then 1 else 0 end) as reorder_rate
    from base
    group by product_id

)

select
    a.*,
    p.product_name,
    p.aisle_name,
    p.department_name
from aggregated a
left join {{ ref('dim_product') }} p
    on a.product_id = p.product_id