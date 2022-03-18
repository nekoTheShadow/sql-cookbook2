SELECT P.tablename, P.indexname, C.column_name
FROM pg_catalog.pg_indexes AS P
JOIN information_schema.columns AS C ON P.tablename = C.table_name
WHERE P.schemaname = 'public';

