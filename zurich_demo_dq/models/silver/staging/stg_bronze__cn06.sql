{{ config(materialized='ephemeral') }}
 
with new_data as (
    select ID_document, ID_customer, type, expiration_date
    from source('bronze', 'bronze_cn06')
    where ingestion_date = '2024-07-09'
)
 
select * from new_data