
SELECT 
        date_trunc(order_date, month) as MONTH,
        ROUND(SUM(customer_cost), 2) AS RETURN_TOTAL,
        COUNT(distinct order_id) as ORDERS_WITH_RETURNS,
        COUNT(order_id || line_id) as ITEMS_RETURNED
FROM 
        {{ ref('order_line_items') }}
WHERE 
        item_status = 'R' 
GROUP BY 
        date_trunc(order_date, month)
ORDER BY
        date_trunc(order_date, month)