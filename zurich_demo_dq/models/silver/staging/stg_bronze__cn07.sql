-- Modello ephemeral (quindi è solo una tabella virtuale)
-- Serve solo per estrapolare i dati di una determinata giornata dalla bronze_cn07

{{ config(materialized='ephemeral') }}

WITH new_data AS (
    SELECT ID_note, ID_customer, marital_status, age, email
    FROM {{ source('bronze', 'bronze_cn07') }}
    WHERE ingestion_date = date(getdate())
)

SELECT *
FROM new_data