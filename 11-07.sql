SELECT ename
FROM (
  SELECT *, LEAD(sal) OVER (ORDER BY hiredate) AS prev_sal
  FROM emp
) T
WHERE sal < prev_sal
