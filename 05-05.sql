SELECT fkeys.table_name, fkeys.constraint_name, fkeys.column_name, ind_cols.indexname
FROM (
  SELECT a.constraint_schema, a.table_name, a.constraint_name, a.column_name 
  FROM information_schema.key_column_usage a
  JOIN information_schema.referential_constraints b
  ON a.constraint_name = b.constraint_name AND a.constraint_schema = b.constraint_schema
  WHERE a.table_name = 'EMP'
) fkeys
LEFT OUTER JOIN (
  SELECT a.schemaname, a.tablename, a.indexname, b.column_name
  FROM pg_catalog.pg_indexes a
  JOIN information_schema.columns b
  ON a.tablename = b.table_name AND a.schemaname = b.table_schema
) ind_cols
ON fkeys.constraint_schema = ind_cols.schemaname and fkeys.table_name = ind_cols.tablename and fkeys.column_name = ind_cols.column_name
where ind_cols.indexname is null

