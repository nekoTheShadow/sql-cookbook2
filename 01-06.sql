SELECT *
FROM (
  SELECT sal AS salary, comm AS commission
  FROM emp
) AS X
WHERE salary < 5000

