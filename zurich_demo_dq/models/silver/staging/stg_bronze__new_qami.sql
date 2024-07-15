{{config(materialized='ephemeral')}}

with new_data as(
    select *
    from {{source('bronze', 'bronze_qami')}}
    where date(ingestion_date) = date(getdate())
    ),

    dedup_new_data as(
    {{ dbt_utils.deduplicate
        (
        relation='new_data',
        partition_by='ID_customer',
        order_by='ID_customer')
    }}
    )

select * from dedup_new_data
