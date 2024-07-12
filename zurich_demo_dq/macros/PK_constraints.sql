-- Macro che manda in errore se viene violata una chiave primaria
-- Questa macro è un test che viene richiamato nello yml (non funziona a me)

{% test PK_constraints(model, column_name, schema_silver_name, table_silver_name) %}

with
existing_id as(
    select ID_customer
    from {{ source(schema_silver_name, table_silver_name)}}
),
validation_errors as (
    select *
    from {{model}}
    where {{ column_name }} in (select * from existing_id)
)
select * from validation_errors

{% endtest %}