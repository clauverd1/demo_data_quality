{% macro write_pk_failures(source_failure_tables) %}

    {% for source_table in source_failure_tables %}

        {% set sql_statement %}
            select * from source('failure_test', source_table)
        {% endset %}

        {% set results = run_query(sql_statement) %}

        {% for i in }

        select 
            '{{ source_table }}' as table,
            struct nom_key value
            current_timestamp() as timestamp


    {% endfor %}

{% endmacro %}