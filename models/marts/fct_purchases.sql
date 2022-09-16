with 
order_line_items as (
    select 
        *,
        coalesce(round(sum(customer_cost), 2),0) as purchase_total
    from {{ ref('int_order_line_items') }}
    group by customer_id
    
),

customers as (
    select * from {{ ref('stg_tpch__customers') }}
),

lost_revenue as (
    select
        order_id,
        customer_id,
        sum(customer_cost) as revenue_lost
    from order_line_items
    where item_status = 'R' 
        group by customer_id, order_id
),

joined as (

    select 
        customers.customer_id,
        customers.customer_name,
        order_line_items.purchase_total
        coalesce(lost_revenue.revenue_lost, 0) as return_total,
        coalesce(order_line_items.purchase_total - coalesce(lost_revenue.revenue_lost, 0), 0) as lifetime_value,
        (coalesce(lost_revenue.revenue_lost, 0)/order_line_items.purchase_total*100 as return_pct,
        case 
            when coalesce(purchase_total, 0) = 0 then 'red' 
            when (coalesce(lr.revenue_lost, 0)/coalesce(purchase_total,0))*100 <= 25 then 'green' 
            when (coalesce(lr.revenue_lost, 0)/coalesce(purchase_total,0))*100 <= 50 then 'yellow' 
            when (coalesce(lr.revenue_lost, 0)/coalesce(purchase_total,0))*100 <= 75 then 'orange' 
            when (coalesce(lr.revenue_lost, 0)/coalesce(purchase_total,0))*100 <= 100 then 'red' 
        end as customer_status
    from 


)

select * from joined

