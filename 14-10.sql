-- Oracle
/**
CREATE TABLE dept (
  deptno INT,
  dname  VARCHAR(14),
  loc    VARCHAR(13)
);

CREATE TYPE generic_obj AS OBJECT (
  val1 varchar2(10),
  val2 varchar2(10),
  val3 date
)
**/

SELECT X.deptno, X.ename, X.sal, X.multival.val1 AS dname, X.multival.val2 AS loc, X.multival.val3 AS today
FROM (
  SELECT  E.deptno, E.ename, E.sal, (SELECT generic_obj(D.dname, D.loc, sysdate) FROM dept D WHERE E.deptno = D.deptno) multival
  FROM emp E
) X
