SELECT sal
FROM (
  SELECT sal, DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS RNK
  FROM emp 
  WHERE deptno = 20
  GROUP BY sal
) AS T
WHERE RNK = 1
