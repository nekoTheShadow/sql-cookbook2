SELECT 
  hiredate, 
  sal,
  SUM(sal) OVER (ORDER BY hiredate RANGE BETWEEN '90 day' PRECEDING AND CURRENT ROW)
FROM emp
ORDER BY hiredate
