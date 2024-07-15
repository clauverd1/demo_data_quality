{{config(materialized='table')}}

with silver_write as (
    select *
    from {{ ref("stg_bronze__new_cn07") }}
)

select * from silver_write