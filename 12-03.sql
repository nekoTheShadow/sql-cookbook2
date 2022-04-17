DROP VIEW IF EXISTS emp_cnts;
CREATE VIEW emp_cnts AS 
  SELECT 
    SUM(CASE WHEN deptno = 10 THEN 1 ELSE 0 END) AS deptno_10,
    SUM(CASE WHEN deptno = 20 THEN 1 ELSE 0 END) AS deptno_20,
    SUM(CASE WHEN deptno = 30 THEN 1 ELSE 0 END) AS deptno_30
  FROM emp;
  
  
WITH A (deptno, counts_by_dept) AS (
            SELECT 10, deptno_10 FROM emp_cnts
  UNION ALL SELECT 20, deptno_20 FROM emp_cnts
  UNION ALL SELECT 30, deptno_30 FROM emp_cnts
)
SELECT * FROM A
