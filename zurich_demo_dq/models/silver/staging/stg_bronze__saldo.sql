-- Modello ephemeral (quindi è solo una tabella virtuale)
-- Serve per estrapolare i dati di una determinata giornata dalla bronze_saldo 
-- e anche per deduplicare in caso di righe duplicate

{{ config(materialized='ephemeral') }}

WITH new_data AS (
    SELECT *
    FROM {{ source('bronze', 'bronze_saldo') }}
    WHERE ingestion_date = date(date(date_add(getdate(), 1)))
), 
    dedup AS ({{ dbt_utils.deduplicate(
    relation = 'new_data',
    partition_by = 'ID_saldo, ID_customer, bank_name, balance, IBAN', --metto tutti i campi perchè voglio deduplicare nel caso in cui ci siano righe identiche
    order_by = 'ID_customer'
   )
}})

SELECT *
FROM dedup