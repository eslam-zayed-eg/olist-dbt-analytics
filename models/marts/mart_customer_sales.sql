{{ config(materialized='table') }}

select
    c.customer_unique_id,
    c.customer_city,
    c.customer_state,
    count(distinct o.order_id) as total_orders,
    sum(s.total_sales) as total_sales,
    sum(s.total_freight) as total_freight,
    sum(s.total_amount) as total_amount
from {{ ref('fct_orders') }} as o
inner join {{ ref('dim_customers') }} as c
    on o.customer_id = c.customer_id
inner join {{ ref('mart_sales') }} as s
    on o.order_id = s.order_id
group by
    c.customer_unique_id,
    c.customer_city,
    c.customer_state