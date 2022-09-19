with 

source as (
    select * from {{ source('TPCH_SF1', 'nation') }}
),

cleaned as (
    select
        n_nationkey as nation_id,
        n_regionkey as region_id,
        n_name as name,
        n_comment as comment
    from source
)

select * from cleaned