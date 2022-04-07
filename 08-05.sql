WITH A (days) AS (
  SELECT MAX(CASE WHEN ename IN ('ALLEN', 'WARD') THEN hiredate END) 
           - MIN(CASE WHEN ename IN ('ALLEN', 'WARD') THEN hiredate END) AS days
  FROM emp
)
SELECT days*24 AS hours, days*24*60 AS minutes, days*24*60*60 AS seconds
FROM A

