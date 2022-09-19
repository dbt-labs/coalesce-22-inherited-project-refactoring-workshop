with 

source as (
    select * from {{ source('TPCH_SF1', 'region') }}
),

cleaned as (
    select
        r_regionkey as region_id,
        r_name as name,
        r_comment as comment
    from source
)

select * from cleaned