SELECT REGEXP_REPLACE(data, '[0-9]', '', 'g') AS ename,
       CAST(REGEXP_REPLACE(data, '[a-z]', '', 'gi') AS INT) AS sal
FROM (SELECT ename || sal FROM emp) AS T (data)
