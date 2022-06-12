-- db2
DROP TABLE IF EXISTS emp;
CREATE TABLE emp (
  empno    INT,
  ename    VARCHAR(10),
  job      VARCHAR(9),
  mgr      INT,
  hiredate DATE,
  sal      INT,
  comm     INT,
  deptno   INT
);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES 
    (7369, 'SMITH' , 'CLERK'    , 7902, TO_DATE('17-DEC-2005', 'DD-MON-YYYY'), 800,  NULL, 20),
    (7499, 'ALLEN' , 'SALESMAN' , 7698, TO_DATE('20-FEB-2006', 'DD-MON-YYYY'), 1600, 300 , 30),
    (7521, 'WARD'  , 'SALESMAN' , 7698, TO_DATE('22-FEB-2006', 'DD-MON-YYYY'), 1250, 500 , 30),
    (7566, 'JONES' , 'MANAGER'  , 7839, TO_DATE('02-APR-2006', 'DD-MON-YYYY'), 2975, NULL, 20),
    (7654, 'MARTIN', 'SALESMAN' , 7698, TO_DATE('28-SEP-2006', 'DD-MON-YYYY'), 1250, 1400, 30),
    (7698, 'BLAKE' , 'MANAGER'  , 7839, TO_DATE('01-MAY-2006', 'DD-MON-YYYY'), 2850, NULL, 30),
    (7782, 'CLARK' , 'MANAGER'  , 7839, TO_DATE('09-JUN-2006', 'DD-MON-YYYY'), 2450, NULL, 10),
    (7788, 'SCOTT' , 'ANALYST'  , 7566, TO_DATE('09-DEC-2007', 'DD-MON-YYYY'), 3000, NULL, 20),
    (7839, 'KING'  , 'PRESIDENT', NULL, TO_DATE('17-NOV-2006', 'DD-MON-YYYY'), 5000, NULL, 10),
    (7844, 'TURNER', 'SALESMAN' , 7698, TO_DATE('08-SEP-2006', 'DD-MON-YYYY'), 1500, 0   , 30),
    (7876, 'ADAMS' , 'CLERK'    , 7788, TO_DATE('12-JAN-2008', 'DD-MON-YYYY'), 1100, NULL, 20),
    (7900, 'JAMES' , 'CLERK'    , 7698, TO_DATE('03-DEC-2006', 'DD-MON-YYYY'),  950, NULL, 30),
    (7902, 'FORD'  , 'ANALYST'  , 7566, TO_DATE('03-DEC-2006', 'DD-MON-YYYY'), 3000, NULL, 20),
    (7934, 'MILLER', 'CLERK'    , 7782, TO_DATE('23-JAN-2007', 'DD-MON-YYYY'), 1300, NULL, 10);

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
