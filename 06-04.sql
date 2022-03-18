SELECT ename, 
       REGEXP_REPLACE(ename, '[AIUEO]', '', 'g') AS stripeed1,
       sal,
       REPLACE(CAST(sal AS VARCHAR), '0', '') AS stripeed2
FROM emp
