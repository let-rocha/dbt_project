select
    order_id,
    order_item_id,
    product_id,
    seller_id,
    price,
    freight_value as shipping_cost
from {{ source('olist_raw', 'order_items') }}