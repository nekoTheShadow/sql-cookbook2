DELETE FROM emp E
WHERE NOT EXISTS (
  SELECT *
  FROM dept D
  WHERE E.deptno = D.deptno
)