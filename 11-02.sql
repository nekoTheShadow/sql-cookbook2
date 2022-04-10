SELECT ename
FROM (
  SELECT ename, ROW_NUMBER() OVER (ORDER BY ename) AS rn
  FROM emp
) T
WHERE rn % 2 = 1
