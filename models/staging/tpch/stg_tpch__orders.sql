with source as (

    select * from {{ source('TPCH_SF1', 'orders') }}

),

renamed as (

    select
        -- ids
        o_orderkey as order_id,
        o_custkey as customer_id,

        -- info
        o_orderpriority as order_priority,
        o_shippriority as shipping_priority,
        o_clerk as clerk_name,
        o_orderstatus as order_status,
        o_totalprice as total_price_dollars,

        -- timestamps
        o_orderdate as ordered_on,

        -- comments
        o_comment

    from source

)

select * from renamed