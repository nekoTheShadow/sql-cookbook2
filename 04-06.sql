-- db2
DROP TABLE IF EXISTS dept;
DROP TABLE IF EXISTS dept_east;
DROP TABLE IF EXISTS dept_mid;
DROP TABLE IF EXISTS dept_west;

CREATE TABLE dept (deptno INT, dname VARCHAR(14), loc VARCHAR(13));
CREATE TABLE dept_east (deptno INT, dname VARCHAR(14), loc VARCHAR(13) CHECK(loc IN ('NEW YORK', 'BOSTON')));
CREATE TABLE dept_mid  (deptno INT, dname VARCHAR(14), loc VARCHAR(13) CHECK(loc IN ('CHICAGO')));
CREATE TABLE dept_west (deptno INT, dname VARCHAR(14), loc VARCHAR(13) CHECK(loc IN ('DALLAS')));
INSERT INTO dept (deptno, dname, loc) VALUES 
    (10, 'ACCOUNTING', 'NEW YORK'),
    (20, 'RESEARCH'  , 'DALLAS'  ),
    (30, 'SALES'     , 'CHICAGO' ),
    (40, 'OPERATIONS', 'BOSTON'  );

INSERT INTO (
            SELECT * FROM dept_west
  UNION ALL SELECT * FROM dept_east
  UNION ALL SELECT * FROM dept_mid
) SELECT * FROM dept;

SELECT * FROM dept_west;
SELECT * FROM dept_east;
SELECT * FROM dept_mid;