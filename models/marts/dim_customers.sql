-- models/marts/dim_customers.sql
select
    customer_id,
    customer_unique_id,
    state,   
    city     
from {{ ref('stg_customers') }}