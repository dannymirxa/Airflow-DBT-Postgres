SELECT
    o.order_id,
    o.customer_id,
    o.total_amount,
    o.order_data->>'shipping_method' AS shipping_method,
    o.order_data->>'notes' AS notes,
    item.value AS raw_item
FROM {{ source('public', 'orders') }} o
CROSS JOIN LATERAL jsonb_array_elements(o.order_data->'items') AS item(value)