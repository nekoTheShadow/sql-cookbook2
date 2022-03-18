DROP VIEW IF EXISTS V;
CREATE VIEW V AS
            SELECT ename AS data                 FROM emp WHERE deptno = 10
  UNION ALL SELECT ename || ',$' || sal || '.00' FROM emp WHERE deptno = 20
  UNION ALL SELECT ename || sal                  FROM emp WHERE deptno = 30;
  
SELECT *
FROM V
WHERE data SIMILAR TO '[A-Z0-9]*'
