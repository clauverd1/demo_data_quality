{{config(materialized='ephemeral')}}

with new_data as(
    select *
    from {{source('bronze', 'bronze_cn02')}}
    where date(ingestion_date) = date(getdate())
    )

select * from new_data