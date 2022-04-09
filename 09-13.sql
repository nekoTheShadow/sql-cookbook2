DROP TABLE IF EXISTS emp_project;
CREATE TABLE emp_project (
  empno      INT,
  ename      VARCHAR(10),
  proj_id    INT,
  proj_start DATE,
  proj_end   DATE
);
INSERT INTO emp_project VALUES 
  (7782, 'CLARK',   1, '16-JUN-2005', '18-JUN-2005'),
  (7782, 'CLARK',   4, '19-JUN-2005', '24-JUN-2005'),
  (7782, 'CLARK',   7, '22-JUN-2005', '25-JUN-2005'),
  (7782, 'CLARK',  10, '25-JUN-2005', '28-JUN-2005'),
  (7782, 'CLARK',  13, '28-JUN-2005', '02-JUL-2005'),
  (7839, 'KING',    2, '17-JUN-2005', '21-JUN-2005'),
  (7839, 'KING',    8, '23-JUN-2005', '25-JUN-2005'),
  (7839, 'KING',   14, '29-JUN-2005', '30-JUN-2005'),
  (7839, 'KING',   11, '26-JUN-2005', '27-JUN-2005'),
  (7839, 'KING',    5, '20-JUN-2005', '24-JUN-2005'),
  (7934, 'MILLER',  3, '18-JUN-2005', '22-JUN-2005'),
  (7934, 'MILLER', 12, '27-JUN-2005', '28-JUN-2005'),
  (7934, 'MILLER', 15, '30-JUN-2005', '03-JUL-2005'),
  (7934, 'MILLER',  9, '24-JUN-2005', '27-JUN-2005'),
  (7934, 'MILLER',  6, '21-JUN-2005', '23-JUN-2005');
  
SELECT E1.empno, E1.ename, 'project ' || E1.proj_id || ' overlaps project ' || E2.proj_id AS msg
FROM emp_project E1
JOIN emp_project E2
ON E1.empno = E2.empno
AND E1.proj_id > E2.proj_id
AND E1.proj_start <= E2.proj_end
AND E1.proj_end >= E2.proj_start
