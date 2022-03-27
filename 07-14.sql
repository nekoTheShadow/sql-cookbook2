SELECT REGEXP_REPLACE(val, '[^0-9]', '', 'g')
FROM (VALUES ('paul123f321')) AS T (val)
