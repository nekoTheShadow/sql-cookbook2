DROP VIEW IF EXISTS V;
CREATE VIEW V AS 
  SELECT E.ename || ' ' || E.empno || ' ' || D.dname AS data
  FROM emp AS E
  JOIN dept AS D ON E.deptno = D.deptno;

SELECT data
FROM V
ORDER BY CAST(SUBSTRING(data FROM '[0-9]+') AS INT)
