with base as (

    select
        order_id,
        customer_id,
        order_number,
        days_since_prior_order

    from {{ ref('stg_orders') }}

),

cumulative_days as (

    select
        order_id,
        customer_id,
        order_number,
        sum(coalesce(days_since_prior_order,0)) 
            over (
                partition by customer_id
                order by order_number
                rows between unbounded preceding and current row
            ) as cumulative_days

    from base

)

select
    order_id,
    customer_id,
    order_number,

    -- synthetic order date
    dateadd(day, cumulative_days, '2017-01-01') as order_date

from cumulative_days