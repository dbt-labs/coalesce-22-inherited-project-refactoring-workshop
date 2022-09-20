with 

filtered_parts as (
    select * from {{ ref('report_base__eu_lowcost_brass_suppliers') }}
    where part_size = 15 and nation = 'UNITED KINGDOM'
),

report_renaming as (
    select
        part_name,
        part_retail_price as retailprice,
        supplier_name,
        part_manufacturer,
        supplier_address as suppaddr,
        supplier_phone_number as supp_phone,
        available_qty as num_available
    from filtered_parts
)

select * from report_renaming