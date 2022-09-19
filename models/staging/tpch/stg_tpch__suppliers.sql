with 

source as (
    select * from {{ source('TPCH_SF1', 'supplier') }}
),

cleaned as (
    select
        s_suppkey as supplier_id,
        s_nationkey as nation_id,
        s_name as name,
        s_address as address,
        s_phone as phone_number,
        s_acctbal as account_balance,
        s_comment as comment
    from source
)

select * from cleaned