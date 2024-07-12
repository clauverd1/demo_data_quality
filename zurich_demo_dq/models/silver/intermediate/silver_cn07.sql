-- Questo modello mi serve per creare una tabella incremental dal nome silver_cn07 che prende i dati 
-- di stg_bronze__cn07 ovvero i dati della bronze_cn07 ma giornalieri (è una tabella in append)

SELECT * 
FROM {{ ref("stg_bronze__cn07") }}
