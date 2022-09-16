WITH 

orders as (
    select * from {{ ref('stg_tpch__orders') }}
),

line_items as (
        SELECT
                order_id,
                line_id,
                supplier_id,
                part_id,
                item_status,
                ROUND(extended_price_dollars * (1 - discount), 2) as item_cost
        FROM {{ ref('stg_tpch__line_items') }}    
),

joined as (

    select 
        -- Order id + line id create the primary key
            orders.order_id,
            line_items.line_id,
            orders.customer_id,
            line_items.supplier_id,
            line_items.part_id,
            line_items.item_status,
            line_items.item_cost as customer_cost,

            orders.order_date
    from line_items  
    left join orders 
        on line_items.order_id = orders.order_id
    order by
            orders.customer_id,
            orders.ordered_on,
            orders.order_id,
            line_items.line_id
)

select * from final