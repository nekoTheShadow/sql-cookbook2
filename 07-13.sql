SELECT AVG(sal)
FROM emp
WHERE sal NOT IN (
  (SELECT MIN(sal) FROM emp),
  (SELECT MAX(sal) FROM emp)
)
