DROP TABLE emp;
DROP TABLE dept;
DROP TABLE T1;
DROP TABLE T10;
DROP TABLE T100;
DROP TABLE T500;

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
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES     (7369, 'SMITH' , 'CLERK'    , 7902, TO_DATE('17-DEC-2005', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH'), 800,  NULL, 20);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES     (7499, 'ALLEN' , 'SALESMAN' , 7698, TO_DATE('20-FEB-2006', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH'), 1600, 300 , 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES     (7521, 'WARD'  , 'SALESMAN' , 7698, TO_DATE('22-FEB-2006', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH'), 1250, 500 , 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES     (7566, 'JONES' , 'MANAGER'  , 7839, TO_DATE('02-APR-2006', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH'), 2975, NULL, 20);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES     (7654, 'MARTIN', 'SALESMAN' , 7698, TO_DATE('28-SEP-2006', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH'), 1250, 1400, 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES     (7698, 'BLAKE' , 'MANAGER'  , 7839, TO_DATE('01-MAY-2006', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH'), 2850, NULL, 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES     (7782, 'CLARK' , 'MANAGER'  , 7839, TO_DATE('09-JUN-2006', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH'), 2450, NULL, 10);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES     (7788, 'SCOTT' , 'ANALYST'  , 7566, TO_DATE('09-DEC-2007', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH'), 3000, NULL, 20);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES     (7839, 'KING'  , 'PRESIDENT', NULL, TO_DATE('17-NOV-2006', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH'), 5000, NULL, 10);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES     (7844, 'TURNER', 'SALESMAN' , 7698, TO_DATE('08-SEP-2006', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH'), 1500, 0   , 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES     (7876, 'ADAMS' , 'CLERK'    , 7788, TO_DATE('12-JAN-2008', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH'), 1100, NULL, 20);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES     (7900, 'JAMES' , 'CLERK'    , 7698, TO_DATE('03-DEC-2006', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH'),  950, NULL, 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES     (7902, 'FORD'  , 'ANALYST'  , 7566, TO_DATE('03-DEC-2006', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH'), 3000, NULL, 20);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES     (7934, 'MILLER', 'CLERK'    , 7782, TO_DATE('23-JAN-2007', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH'), 1300, NULL, 10);

CREATE TABLE dept (
  deptno INT,
  dname  VARCHAR(14),
  loc    VARCHAR(13)
);
INSERT INTO dept (deptno, dname, loc) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept (deptno, dname, loc) VALUES (20, 'RESEARCH'  , 'DALLAS'  );
INSERT INTO dept (deptno, dname, loc) VALUES (30, 'SALES'     , 'CHICAGO' );
INSERT INTO dept (deptno, dname, loc) VALUES (40, 'OPERATIONS', 'BOSTON'  );

CREATE TABLE T1   (id INT);
CREATE TABLE T10  (id INT);
CREATE TABLE T100 (id INT);
CREATE TABLE T500 (id INT);

INSERT INTO T1   SELECT * FROM (WITH r (id) AS (SELECT 1 FROM DUAL UNION ALL SELECT id + 1 FROM r WHERE id + 1 <= 1)   SELECT * FROM r);
INSERT INTO T10  SELECT * FROM (WITH r (id) AS (SELECT 1 FROM DUAL UNION ALL SELECT id + 1 FROM r WHERE id + 1 <= 10)  SELECT * FROM r);
INSERT INTO T100 SELECT * FROM (WITH r (id) AS (SELECT 1 FROM DUAL UNION ALL SELECT id + 1 FROM r WHERE id + 1 <= 100) SELECT * FROM r);
INSERT INTO T500 SELECT * FROM (WITH r (id) AS (SELECT 1 FROM DUAL UNION ALL SELECT id + 1 FROM r WHERE id + 1 <= 500) SELECT * FROM r);
