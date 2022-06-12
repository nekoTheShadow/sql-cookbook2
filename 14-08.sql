-- Oracle
WITH 
A AS (
  SELECT ename, sal, DENSE_RANK() OVER (ORDER BY sal DESC) DR
  FROM emp
),
B AS (
  SELECT ename, sal, CASE WHEN DR <= 3 THEN 1 WHEN DR <= 6 THEN 2 ELSE 3 END grp
  FROM A
), 
C AS (
  SELECT ename, sal, grp, ROW_NUMBER() OVER (PARTITION BY grp ORDER BY sal DESC) grp_rnk
  FROM B
)
SELECT
  MAX(CASE WHEN grp = 1 THEN ename || ' (' || sal || ')' END) AS top_3,
  MAX(CASE WHEN grp = 2 THEN ename || ' (' || sal || ')' END) AS next_3,
  MAX(CASE WHEN grp = 3 THEN ename || ' (' || sal || ')' END) AS rest
FROM C
GROUP BY grp_rnk
ORDER BY grp_rnk
