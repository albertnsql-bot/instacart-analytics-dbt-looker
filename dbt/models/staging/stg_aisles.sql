select
    aisle_id,
    aisle as aisle_name
from {{ source('raw', 'raw_aisles') }}
