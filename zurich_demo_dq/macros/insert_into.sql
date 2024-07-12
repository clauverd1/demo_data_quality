-- CON QUESTA MACRO VOGLIO GENERARE DIZIONARI DALLE RIGHE DELLA TABELLA GENERATA DALLO STORE_FAILURES

-- {% macro insert_into(entity) -%}

--     select * 
--     from {{ source('failures', 'pk_constraints_stg_bronze_'entity) }}

-- {%- endmacro %}