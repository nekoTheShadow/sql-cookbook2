SELECT ename, sal, SUM(sal) OVER (ORDER BY sal, empno)
FROM emp
ORDER BY sal;
