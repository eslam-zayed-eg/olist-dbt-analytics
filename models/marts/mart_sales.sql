
{{ config(materialized='table') }}

select
    order_id,
    count(*) as total_items,
    sum(price) as total_sales,
    sum(freight_value) as total_freight,
    sum(total_item_amount) as total_amount
from {{ ref('fct_order_items') }}
group by order_id