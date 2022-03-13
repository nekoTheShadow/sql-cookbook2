SELECT ename, sal, job, comm
FROM emp
ORDER BY CASE WHEN JOB = 'SALESMAN' THEN comm ELSE sal END
