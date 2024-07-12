with silver_write as (
    select *
    from {{ ref("stg_bronze__cn06") }}
)

select * from silver_write