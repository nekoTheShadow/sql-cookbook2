SELECT
  ename,
  deptno,
  COUNT(*) OVER (PARTITION BY deptno) deptno_cnt,
  job,
  COUNT(*) OVER (PARTITION BY job) job_cnt,
  COUNT(*) OVER () total
FROM emp
