WITH RECURSIVE R AS (
    SELECT empno, CAST(ename AS text) AS emp_tree 
    FROM emp 
    WHERE mgr IS NULL
  UNION ALL
    SELECT S.empno, R.emp_tree || ' - ' || S.ename
    FROM emp AS S
    JOIN R ON S.mgr = R.empno
)
SELECT emp_tree FROM R
