-- Snapshot che prende la stg_bronze__saldo e quindi i dati di bronze di un determinato giorno
-- e successivamente fa una SCD2 con strategia timestamp sulla colonna di ingestion date, prendendo come
-- chiave unica l'ID_saldo: se esiste un duplicato di ID_saldo, allora si guarda l'ingestion_date 
-- e si fa uno storico

{% snapshot snap_silver_saldo %}

{{
    config(
        target_schema = 'dbt_demo_dq',
        unique_key = 'ID_saldo',
        strategy = 'timestamp',
        updated_at = 'ingestion_date',
    )
}}

SELECT *
FROM {{ ref("stg_bronze__saldo") }}

{% endsnapshot %}