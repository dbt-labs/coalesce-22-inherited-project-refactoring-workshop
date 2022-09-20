with 

parts_filtered as (
    select * from {{ ref('dim_supplier_parts') }}
    where part_material = 'brass'
        and region = 'EUROPE'
        and is_lowest_cost
)

select * from parts_filtered 