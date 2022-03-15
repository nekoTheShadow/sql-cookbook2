DROP TABLE IF EXISTS dept_east;
CREATE TABLE dept_east (
  deptno INT,
  dname  VARCHAR(14),
  loc    VARCHAR(13)
);
INSERT INTO dept_east (deptno, dname, loc)
SELECT deptno, dname, loc
FROM dept;
SELECT * FROM dept;
