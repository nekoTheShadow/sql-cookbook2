-- db2
DROP TABLE IF EXISTS emp_commission;
CREATE TABLE emp_commission (deptno INT, empno INT, ename VARCHAR(10), comm INT);
INSERT INTO emp_commission (deptno, empno, ename, comm) VALUES 
  (10, 7782, 'CLARK',  NULL),
  (10, 7839, 'KING',   NULL),
  (10, 7934, 'MILLER', NULL);
  
MERGE INTO emp_commission EC
USING (SELECT * FROM emp) E ON (EC.empno = E.empno)
WHEN MATCHED AND E.sal < 2000 THEN
  DELETE
WHEN MATCHED THEN
  UPDATE SET EC.comm = 1000
WHEN NOT MATCHED THEN 
  INSERT (EC.empno, EC.ename, EC.deptno, EC.comm) VALUES (E.empno, E.ename, E.deptno, E.comm);

SELECT * FROM emp_commission;
