with source as (

    select * from {{ source('TPCH_SF1', 'lineitem') }}

),

renamed as (

    select
        -- ids
        l_orderkey as order_id,
        l_suppkey as supplier_id,
        l_partkey as part_id,
        l_linenumber as line_id,

        -- info
        l_returnflag as item_status,
        l_discount as discount,
        l_extendedprice as extended_price_dollars,
        l_quantity as quantity,
        l_linestatus as line_status,
        l_tax as tax_percent,
        l_shipmode as ship_mode,
        l_shipinstruct as shipping_instructions,

        -- timestamps
        l_shipdate as shipped_on,
        l_commitdate as committed_on,
        l_receiptdate as received_on,
        
        -- comments
        l_comment as comment

    from source

)

select * from renamed