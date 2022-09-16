with source as (

    select * from {{ source('TPCH_SF1', 'customer') }}

),

renamed as (

    select
        -- ids
        c_custkey as customer_id,
        c_nationkey as nation_id,
        
        -- info
        c_name as customer_name,
        c_address as customer_address,
        c_phone as customer_phone_number,
        c_acctbal as customer_account_balance,
        c_mktsegment as market_segment,

        -- comments 
        c_comment as comment

    from source

)

select * from renamed
