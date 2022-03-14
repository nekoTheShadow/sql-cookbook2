SELECT E.ename, D.loc, EB.received
FROM emp AS E
JOIN dept AS D ON E.deptno = D.deptno
LEFT OUTER JOIN emp_bonus AS EB ON E.empno = EB.empno

