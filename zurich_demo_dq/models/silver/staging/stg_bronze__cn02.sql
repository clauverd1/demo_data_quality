with new_data as (
    select ID_customer, name, surname, birth_date, birth_place
    from {{ source('bronze', 'bronze_cn02') }}
    where ingestion_date = date(date_add(getdate(),2))
)

select * from new_data