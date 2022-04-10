SELECT E.ename, D.deptno, D.dname, D.loc
FROM dept D 
LEFT OUTER JOIN emp E ON D.deptno = E.deptno AND E.deptno IN (10, 20)
