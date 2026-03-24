with customers as (
    select * from {{ ref('dim_customers') }}
),

order_items as (
    select 
        order_id,
        sum(price) as revenue
    from {{ ref('stg_order_items') }}
    group by 1
),

orders as (
    select 
        o.order_id,
        o.customer_id,
        i.revenue
    from {{ ref('stg_orders') }} o
    join order_items i on o.order_id = i.order_id
)

select
    c.state,
    count(distinct o.order_id) as total_orders,
    sum(o.revenue) as total_revenue,
    safe_divide(sum(o.revenue), count(distinct o.order_id)) as avg_ticket
from orders o
join customers c on o.customer_id = c.customer_id 
group by 1
order by total_revenue desc