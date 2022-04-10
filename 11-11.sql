SELECT 
  deptno, 
  ename, 
  sal, 
  hiredate, 
  LAST_VALUE(sal) OVER (PARTITION BY deptno ORDER BY hiredate ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) latest_sal
FROM emp
ORDER BY deptno

