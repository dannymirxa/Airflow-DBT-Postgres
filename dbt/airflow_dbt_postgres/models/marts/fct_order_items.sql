SELECT
    order_id,
    customer_id,
    shipping_method,
    raw_item->>'product_id' AS product_id,
    raw_item->>'name' AS product_name,
    (raw_item->>'qty')::INT AS quantity,
    (raw_item->>'price')::NUMERIC AS unit_price,
    ((raw_item->>'qty')::INT * (raw_item->>'price')::NUMERIC) AS item_total
FROM {{ ref('stg_orders') }}