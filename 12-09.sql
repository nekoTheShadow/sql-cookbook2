SELECT deptno, REPEAT('*', CAST(COUNT(*) AS INT))
FROM emp
GROUP BY deptno
ORDER BY deptno
