{% set old_etl_relation=ref('UK_Lowcost_Brass_Suppliers') -%}
{% set dbt_relation=ref('report__uk_lowcost_brass_suppliers_size_15') %}

{{ audit_helper.compare_relations(
    a_relation=old_etl_relation,
    b_relation=dbt_relation,
    primary_key="supplier_name || part_name"
) }}