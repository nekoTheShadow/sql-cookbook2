SELECT
  CASE WHEN deptno = 10 THEN ename END AS d10,
  CASE WHEN deptno = 20 THEN ename END AS d20,
  CASE WHEN deptno = 30 THEN ename END AS d30,
  
  CASE WHEN job = 'CLERK'     THEN ename END AS clerks,
  CASE WHEN job = 'MANAGER'   THEN ename END AS mgrs,
  CASE WHEN job = 'PRESIDENT' THEN ename END AS prez,
  CASE WHEN job = 'ANALYST'   THEN ename END AS anals,
  CASE WHEN job = 'SALESMAN'  THEN ename END AS sales
  
FROM emp
