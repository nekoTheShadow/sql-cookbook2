SELECT 
  SUM(CASE WHEN deptno = 10 THEN 1 ELSE 0 END) AS deptno_10,
  SUM(CASE WHEN deptno = 20 THEN 1 ELSE 0 END) AS deptno_20,
  SUM(CASE WHEN deptno = 30 THEN 1 ELSE 0 END) AS deptno_30
FROM emp

