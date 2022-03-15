SELECT *
FROM emp
WHERE COALESCE(comm, 0) < (SELECT comm FROM emp WHERE ename = 'WARD') 
