{{config(materialized='table')}}

with silver_write as (
    select *
    from {{ ref("stg_bronze__new_cn02") }}
)

select * from silver_write