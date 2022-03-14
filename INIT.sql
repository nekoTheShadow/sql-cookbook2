/**
docker run --rm -d \
  -p 5432:5432 \
  -e POSTGRES_USER=testuser \
  -e POSTGRES_PASSWORD=passw0rd \
  -e POSTGRES_DB=testdb \
  postgres:14
**/

DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS dept;
DROP TABLE IF EXISTS T1;
DROP TABLE IF EXISTS T10;
DROP TABLE IF EXISTS T100;
DROP TABLE IF EXISTS T500;

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
    (7369, 'SMITH' , 'CLERK'    , 7902, '17-DEC-2005', 800,  NULL, 20),
    (7499, 'ALLEN' , 'SALESMAN' , 7698, '20-FEB-2006', 1600, 300 , 30),
    (7521, 'WARD'  , 'SALESMAN' , 7698, '22-FEB-2006', 1250, 500 , 30),
    (7566, 'JONES' , 'MANAGER'  , 7839, '02-APR-2006', 2975, NULL, 20),
    (7654, 'MARTIN', 'SALESMAN' , 7698, '28-SEP-2006', 1250, 1400, 30),
    (7698, 'BLAKE' , 'MANAGER'  , 7839, '01-MAY-2006', 2850, NULL, 30),
    (7782, 'CLARK' , 'MANAGER'  , 7839, '09-JUN-2006', 2450, NULL, 10),
    (7788, 'SCOTT' , 'ANALYST'  , 7566, '09-DEC-2007', 3000, NULL, 20),
    (7839, 'KING'  , 'PRESIDENT', NULL, '17-NOV-2006', 5000, NULL, 10),
    (7844, 'TURNER', 'SALESMAN' , 7698, '08-SEP-2006', 1500, 0   , 30),
    (7876, 'ADAMS' , 'CLERK'    , 7788, '12-JAN-2008', 1100, NULL, 20),
    (7900, 'JAMES' , 'CLERK'    , 7698, '03-DEC-2006',  950, NULL, 30),
    (7902, 'FORD'  , 'ANALYST'  , 7566, '03-DEC-2006', 3000, NULL, 20),
    (7934, 'MILLER', 'CLERK'    , 7782, '23-JAN-2007', 1300, NULL, 10);

CREATE TABLE dept (
  deptno INT,
  dname  VARCHAR(14),
  loc    VARCHAR(13)
);
INSERT INTO dept (deptno, dname, loc) VALUES 
    (10, 'ACCOUNTING', 'NEW YORK'),
    (20, 'RESEARCH'  , 'DALLAS'  ),
    (30, 'SALES'     , 'CHICAGO' ),
    (40, 'OPERATIONS', 'BOSTON'  );

CREATE TABLE T1   (id INT);
CREATE TABLE T10  (id INT);
CREATE TABLE T100 (id INT);
CREATE TABLE T500 (id INT);

WITH RECURSIVE r (id) AS (SELECT 1 UNION ALL SELECT id + 1 FROM r WHERE id + 1 <= 1)   INSERT INTO T1   SELECT * FROM r;
WITH RECURSIVE r (id) AS (SELECT 1 UNION ALL SELECT id + 1 FROM r WHERE id + 1 <= 10)  INSERT INTO T10  SELECT * FROM r;
WITH RECURSIVE r (id) AS (SELECT 1 UNION ALL SELECT id + 1 FROM r WHERE id + 1 <= 100) INSERT INTO T100 SELECT * FROM r;
WITH RECURSIVE r (id) AS (SELECT 1 UNION ALL SELECT id + 1 FROM r WHERE id + 1 <= 500) INSERT INTO T500 SELECT * FROM r;

-- レシピ3.6　他の結合を妨げずにクエリに結合を追加する
CREATE TABLE emp_bonus (empno INT, received DATE, type INT);
INSERT INTO emp_bonus(empno, received, type) VALUES (7369, '14-MAR-2015', 1);
INSERT INTO emp_bonus(empno, received, type) VALUES (7900, '14-MAR-2015', 2);
INSERT INTO emp_bonus(empno, received, type) VALUES (7788, '14-MAR-2015', 3);