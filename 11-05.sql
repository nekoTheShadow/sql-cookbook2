SELECT ename, sal
FROM (
  SELECT *, DENSE_RANK() OVER (ORDER BY sal DESC) AS dr
  FROM emp
) T
WHERE dr <= 5
