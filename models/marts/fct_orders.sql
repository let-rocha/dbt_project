with orders as (
    select * from {{ ref('stg_orders') }}
),
items as (
    select 
        order_id, 
        sum(price) as total_price,
        sum(shipping_cost) as total_shipping
    from {{ ref('stg_order_items') }}
    group by 1
)
select
    o.order_id,
    o.customer_id,
    o.order_status,
    o.purchased_at,
    i.total_price,
    i.total_shipping,
    i.total_price + i.total_shipping as total_order_amount
from orders o
left join items i on o.order_id = i.order_id