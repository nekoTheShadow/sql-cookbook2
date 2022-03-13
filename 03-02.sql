SELECT ename, loc
FROM emp  AS E
JOIN dept AS D ON E.deptno = D.deptno
WHERE E.deptno = 10
