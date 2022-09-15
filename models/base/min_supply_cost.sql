
{{
    config(
        materialized='table'
    )
}}
SELECT MIN(ps_supplycost) AS min_supply_cost, PS_PARTKEY AS PARTKEY FROM 
    {{ source('TPCH_SF1', 'PARTSUPP') }},
    {{ source('TPCH_SF1', 'SUPPLIER') }},
    {{ source('TPCH_SF1', 'NATION') }},
    {{ source('TPCH_SF1', 'REGION') }}
WHERE s_suppkey = ps_suppkey
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
GROUP BY PS_PARTKEY