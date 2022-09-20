{% set old_etl_relation=ref('EUR_LOWCOST_BRASS_SUPPLIERS') -%}
{% set dbt_relation=ref('report__eu_lowcost_brass_suppliers_size_15') %}

{{ audit_helper.compare_relations(
    a_relation=old_etl_relation,
    b_relation=dbt_relation,
    primary_key="supplier_name || part_id"
) }}