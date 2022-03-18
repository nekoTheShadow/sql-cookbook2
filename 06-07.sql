SELECT REPLACE(REPLACE(REGEXP_REPLACE(name, '[a-z]', '#', 'g'), '#', ''), ' ' ,'.')
FROM (VALUES ('Stewie Griffin')) AS T(name)
