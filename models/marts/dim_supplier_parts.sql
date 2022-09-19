with

parts as (
    select * from {{ ref('stg_tpch__parts') }}
),

part_suppliers as (
    select * from {{ ref('stg_tpch__part_suppliers') }}
),

suppliers as (
    select * from {{ ref('stg_tpch__suppliers') }}
),

nations as (
    select * from {{ ref('stg_tpch__nations') }}
),

regions as (
    select * from {{ ref('stg_tpch__regions') }}
),

joined as (
    select

        suppliers.supplier_id,
        suppliers.nation_id,
        parts.part_id,

        nations.name as nation,
        regions.name as region,

        part_suppliers.available_qty,
        part_suppliers.supply_cost,
        part_suppliers.comment,

        suppliers.name as supplier_name,
        suppliers.address as supplier_address,
        suppliers.phone_number as supplier_phone_number,
        suppliers.account_balance as supplier_account_balance,
        suppliers.comment as supplier_comment,

        parts.name as part_name,
        parts.manufacturer as part_manufacturer,
        parts.brand as part_brand,
        parts.type as part_type,
        parts.size as part_size,
        parts.container as part_container,
        parts.retail_price as part_retail_price,
        parts.material as part_material,
        parts.comment as part_comment,

        min(part_suppliers.supply_cost) over(
            partition by regions.name, parts.part_id
        ) as lowest_part_cost_in_region
    from suppliers
    left join part_suppliers
        on suppliers.supplier_id = part_suppliers.supplier_id
    left join parts
        on parts.part_id = part_suppliers.part_id
    left join nations
        on nations.nation_id = suppliers.nation_id
    left join regions
        on regions.region_id = nations.region_id
),

enriched as (
    select
        *,
        case
            when supply_cost = lowest_part_cost_in_region
            then true else false
        end as is_lowest_cost
    from joined
)

select * from enriched