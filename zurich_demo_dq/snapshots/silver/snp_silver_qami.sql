{% snapshot snp_silver_qami %}

{{ config(
    target_schema='dbt_demo_dq',
    strategy='timestamp',
    unique_key='ID_customer',
    updated_at='ingestion_date'
    )
}}

select * 
from {{ref("stg_bronze__new_qami")}}

{% endsnapshot %}