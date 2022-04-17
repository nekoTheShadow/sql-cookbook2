SELECT
  deptno, 
  ename,
  job,
  sal,
  CASE WHEN sal = MIN(sal) OVER (PARTITION BY deptno) THEN 'LOW SAL IN DEPT'
       WHEN sal = MAX(sal) OVER (PARTITION BY deptno) THEN 'TOP SAL IN DEPT' END dept_status,
  CASE WHEN sal = MIN(sal) OVER (PARTITION BY job) THEN 'LOW SAL IN JOB'
       WHEN sal = MAX(sal) OVER (PARTITION BY job) THEN 'TOP SAL IN JOB' END job_status
FROM emp
