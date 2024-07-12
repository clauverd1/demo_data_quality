with silver_write as (
    select *
    from {{ ref("stg_bronze__cn02") }}
)

select * from silver_write