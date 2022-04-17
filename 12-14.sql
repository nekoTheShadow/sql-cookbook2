SELECT 
  deptno,
  job,
  SUM(sal),
  GROUPING(deptno) AS deptno_subtotals,
  GROUPING(job) AS job_subtotals
FROM emp
GROUP BY CUBE(deptno, job)
