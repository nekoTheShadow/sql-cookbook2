SELECT 
  deptno,
  ename,
  hiredate,
  LEAD(hiredate) OVER (ORDER BY hiredate) AS next_hiredate,
  LEAD(hiredate) OVER (ORDER BY hiredate) - hiredate AS diff
FROM emp 
WHERE deptno = 10
