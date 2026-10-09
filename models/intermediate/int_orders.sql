select
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date,

    extract(
        epoch from (
            order_delivered_customer_date
            - order_purchase_timestamp
        )
    ) / 86400 as delivery_days

from {{ ref('stg_orders') }}