SELECT
  (ROW_NUMBER() OVER (ORDER BY empno) - 1) / 5 + 1
  empno,
  ename
FROM emp
