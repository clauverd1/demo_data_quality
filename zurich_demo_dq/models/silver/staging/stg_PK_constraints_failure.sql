{% set source_failure_tables = ['cn02'] %}

pk_failures(source_failure_tables)

-- with silver_write as (
--     select *, current_timestamp()
--     from {{ source('failure_test', 'pk_constraints_stg_bronze__cn02') }}
-- )

-- select * from silver_write