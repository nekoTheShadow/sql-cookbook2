SELECT 
  MAX(CASE WHEN job = 'CLERK'     THEN ename END) AS clerks,
  MAX(CASE WHEN job = 'ANALYST'   THEN ename END) AS analysts,
  MAX(CASE WHEN job = 'MANAGER'   THEN ename END) AS mgrs,
  MAX(CASE WHEN job = 'PRESIDENT' THEN ename END) AS prez,
  MAX(CASE WHEN job = 'SALESMAN'  THEN ename END) AS sales
FROM (
  SELECT job, ename, ROW_NUMBER() OVER (PARTITION BY job ORDER BY ename) AS rn
  FROM emp
) T
GROUP BY rn
ORDER BY rn
