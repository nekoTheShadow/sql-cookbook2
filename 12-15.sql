SELECT 
  ename,
  CASE WHEN job = 'CLERK'     THEN 1 ELSE 0 END is_clerk,
  CASE WHEN job = 'SALESMAN'  THEN 1 ELSE 0 END is_sales,
  CASE WHEN job = 'MANAGER'   THEN 1 ELSE 0 END is_mgr,
  CASE WHEN job = 'ANALYST'   THEN 1 ELSE 0 END is_analyst,
  CASE WHEN job = 'PRESIDENT' THEN 1 ELSE 0 END is_prez
FROM emp
