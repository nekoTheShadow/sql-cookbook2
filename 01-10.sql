SELECT ename, job
FROM emp
ORDER BY RANDOM()
FETCH FIRST 5 ROWS ONLY