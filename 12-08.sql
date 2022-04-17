SELECT
  NTILE(4) OVER (ORDER BY empno) AS grp,
  empno,
  ename
FROM emp
