-- EXISTSを利用する
SELECT deptno, dname, loc
FROM dept AS D
WHERE NOT EXISTS (
  SELECT *
  FROM emp AS E
  WHERE D.deptno = E.deptno
);

-- JOINを利用する
SELECT D.deptno, D.dname, D.loc
FROM dept AS D
LEFT OUTER JOIN emp AS E ON D.deptno = E.deptno
WHERE E.deptno IS NULL
