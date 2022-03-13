SELECT ename, job
FROM emp
WHERE deptno IN (10, 20)
AND (ENAME LIKE '%I%' OR JOB LIKE '%ER')
