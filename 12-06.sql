SELECT 
  SUM(CASE WHEN deptno = 20 THEN sal END) - SUM(CASE WHEN deptno = 10 THEN sal END) AS d20_10_diff,
  SUM(CASE WHEN deptno = 20 THEN sal END) - SUM(CASE WHEN deptno = 30 THEN sal END) AS d20_30_diff
FROM emp
