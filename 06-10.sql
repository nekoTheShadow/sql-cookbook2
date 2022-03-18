SELECT deptno, STRING_AGG(ename, ',') AS emps
FROM emp
GROUP BY deptno
