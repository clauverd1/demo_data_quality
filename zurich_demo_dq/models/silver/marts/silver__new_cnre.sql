{{config(materialized='table')}}

{% set relations = 
            dbt_utils.get_relations_by_pattern(database='`catalog-zurich-01`',
                                                schema_pattern= 'dbt_test__audit',
                                                table_pattern='relationships_stg_bronze__new_cnre') 
                                                %}

{% for relation in relations %}

with c{{loop.index - 1}} as(
    select * from {{relation.schema}}.{{relation.identifier}}
)

{% if not loop.last %}
,
{% endif %}

{% endfor %}

select *
from {{ ref('stg_bronze__new_cnre') }} as t

{% for i in range(relations|length) %}

{% if not loop.last %}
and
{% endif %}

 t.ID_customer not in c{{i}}.from_field

{% endfor %} 