WITH RECURSIVE R AS (
    SELECT empno, ename, mgr, 0 AS lvl, CAST(ename AS TEXT) AS leaf_branch_root
    FROM emp 
    WHERE ename = 'MILLER'
  UNION ALL
    SELECT S.empno, S.ename, S.mgr, R.lvl + 1, R.leaf_branch_root || '-->' || S.ename
    FROM emp S
    JOIN R ON S.empno = R.mgr
)
SELECT leaf_branch_root FROM R WHERE lvl = 2;

WITH RECURSIVE R AS (
    SELECT empno, ename, mgr, 0 AS lvl
    FROM emp 
    WHERE ename = 'MILLER'
  UNION ALL
    SELECT S.empno, S.ename, S.mgr, R.lvl + 1
    FROM emp S
    JOIN R ON S.empno = R.mgr
)
SELECT STRING_AGG(ename, '-->' ORDER BY lvl) FROM R;
