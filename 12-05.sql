SELECT 
  CASE WHEN (ROW_NUMBER() OVER (PARTITION BY deptno ORDER BY ename)) = 1 THEN deptno END, 
  ename 
FROM emp
