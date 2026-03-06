select
    order_id,
    user_id as customer_id,
    order_number,
    order_dow,
    order_hour_of_day,
    coalesce(days_since_prior_order, 0) as days_since_prior_order
from {{ source('raw', 'raw_orders') }}
