SELECT E.ename, STRING_AGG(SUBSTR(E.ename, T.id, 1), '' ORDER BY SUBSTR(E.ename, T.id, 1))
FROM emp AS E
CROSS JOIN T10 AS T
WHERE T.id <= LENGTH(E.ename)
GROUP BY E.ename;

