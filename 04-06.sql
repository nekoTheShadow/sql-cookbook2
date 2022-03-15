/**
docker run -d \
  --privileged=true \
  -p 50000:50000 \
  -e LICENSE=accept \
  -e DB2INST1_PASSWORD=passw0rd \
  -e DBNAME=testdb \
  ibmcom/db2:11.5.7.0

docker exec -it <containerid> su - db2inst1
db2 -tv
connect to testdb user db2inst1 using passw0rd;
**/

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