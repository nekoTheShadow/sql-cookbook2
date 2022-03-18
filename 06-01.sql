SELECT SUBSTR(E.ename, T.id, 1)
FROM (SELECT ename FROM emp WHERE ename = 'KING') AS E 
CROSS JOIN T10 AS T
WHERE T.id <= LENGTH(E.ename)

