with 

eu_parts_filtered as (
    select * from {{ ref('report_base__eu_lowcost_brass_suppliers') }}
    where part_size = 15
),

report_renaming as (
    select
        part_name as p_name, 
        part_size as p_size, 
        part_retail_price as p_retailprice, 
        supplier_account_balance as s_acctbal, 
        supplier_name as s_name, 
        nation as n_name, 
        part_id as p_partkey, 
        part_manufacturer as p_mfgr, 
        supplier_address as s_address, 
        supplier_phone_number as s_phone, 
        supplier_comment as s_comment
    from eu_parts_filtered
    order by 
        supplier_account_balance desc, 
        nation, 
        supplier_name, 
        part_id
)

select * from report_renaming