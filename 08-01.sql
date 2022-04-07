SELECT 
  hiredate - INTERVAL '5 DAYS'  AS hd_minus_5d,
  hiredate + INTERVAL '5 DAYS'  AS hd_plus_5d,
  hiredate - INTERVAL '5 MONTH' AS hd_minus_5m,
  hiredate + INTERVAL '5 MONTH' AS hd_plus_5m,
  hiredate - INTERVAL '5 YEAR'  AS hd_minus_5y,
  hiredate + INTERVAL '5 YEAR'  AS hd_plus_5y
FROM emp 
WHERE deptno = 10
