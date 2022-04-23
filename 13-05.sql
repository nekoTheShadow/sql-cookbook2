WITH RECURSIVE R AS (
    SELECT empno, ename, 1 AS is_root
    FROM emp 
    WHERE mgr IS NULL
  UNION ALL
    SELECT S.empno, S.ename, 0
    FROM emp AS S
    JOIN R ON S.mgr = R.empno
)
SELECT
  T.ename, 
  T.is_root,
  CASE WHEN T.is_root = 0 AND T.is_leaf = 0 THEN 1 ELSE 0 END AS is_branch,
  T.is_leaf
FROM (
  SELECT
    ename,
    is_root,
    CASE WHEN (SELECT COUNT(*) FROM emp AS S WHERE S.mgr = R.empno) = 0 THEN 1 ELSE 0 END AS is_leaf -- 自分をマネージャにしている人がいなかったらleaf
  FROM R
) AS T

