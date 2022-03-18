SELECT *
FROM information_schema.table_constraints AS TC
JOIN information_schema.key_column_usage AS KCU 
ON (TC.table_name, TC.table_schema,TC.constraint_name) = (KCU.table_schema, KCU.table_schema, KCU.constraint_name)
WHERE TC.table_schema = 'public'
AND TC.table_name = 'emp';

