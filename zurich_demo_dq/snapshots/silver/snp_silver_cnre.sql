{% snapshot snp_silver_cnre %}

{{ config(
    target_schema='dbt_demo_dq',
    strategy='timestamp',
    unique_key='ID_customer',
    updated_at='ingestion_date'
    )
}}

select * 
from {{ref("silver__new_cnre")}}

{% endsnapshot %}