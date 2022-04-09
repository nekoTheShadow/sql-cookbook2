SELECT E1.ename || ' was hired on the same month and weekday as ' || E2.ename AS msg
FROM emp E1
JOIN emp E2 
ON E1.empno < E2.empno
AND EXTRACT(MONTH FROM E1.hiredate) = EXTRACT(MONTH FROM E2.hiredate) 
AND EXTRACT(DOW FROM E1.hiredate) = EXTRACT(DOW FROM E2.hiredate)
