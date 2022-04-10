SELECT deptno, ename, sal, hiredate, COALESCE(CAST(sal - LEAD(sal) OVER (PARTITION BY deptno ORDER BY hiredate) AS VARCHAR), 'N/A')
FROM emp
