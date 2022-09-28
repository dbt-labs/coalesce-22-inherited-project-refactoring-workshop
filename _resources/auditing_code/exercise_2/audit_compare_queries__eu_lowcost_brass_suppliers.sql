{% set old_query %}
  select * from {{ ref('EUR_LOWCOST_BRASS_SUPPLIERS') }}
{% endset %}

{% set new_query %}
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
  from {{ ref('report__eu_lowcost_brass_suppliers_size_15') }}
{% endset %}

{{ audit_helper.compare_queries(
    a_query=old_query,
    b_query=new_query,
    primary_key="s_name || p_name"
) }}