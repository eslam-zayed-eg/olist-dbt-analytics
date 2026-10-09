
{{ config(materialized='table') }}

select
    customer_state,
    count(*) as customer_records,
    sum(total_orders) as total_orders,
    sum(total_sales) as total_sales,
    sum(total_freight) as total_freight,
    sum(total_amount) as total_amount
from {{ ref('mart_customer_sales') }}
group by customer_state