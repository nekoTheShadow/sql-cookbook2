DROP TABLE IF EXISTS dept_2;
CREATE TABLE dept_2 AS SELECT * FROM dept WHERE 1 <> 1;
SELECT * FROM dept_2;