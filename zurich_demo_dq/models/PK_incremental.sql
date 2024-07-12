-- QUESTO MODELLO UTILIZZA LA MACRO insert_into PER CREARE UNA TABELLA INCREMENTAL DELLE VIOLAZIONI DELLA PK

-- {% for entity in ['cn02', 'cn07'] %}

--     SELECT pk_constraint_{{entity}} as type, 
--             current_timestamp as date, 
--             (macro) as columns
--     {% if not loop.last %}
--         UNION ALL
--     {% endif %}

-- {% endfor %}