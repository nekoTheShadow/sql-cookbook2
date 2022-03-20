SELECT MIN(sal), MAX(sal) FROM emp;
SELECT deptno, MIN(sal), MAX(sal) FROM emp GROUP BY deptno;
