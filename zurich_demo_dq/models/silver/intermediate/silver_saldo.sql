-- Questo modello mi serve per creare una tabella incremental dal nome silver_saldo che prende i dati 
-- della tabella generata dallo snapshot (anche incremental), ma selezionando solo i campi 
-- che vediamo scritti di sotto

SELECT ID_saldo, ID_customer, bank_name, balance, IBAN
from {{ source('bronze', 'snap_silver_saldo') }} 