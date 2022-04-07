SELECT hiredate - (SELECT hiredate FROM emp WHERE ename = 'WARD')
FROM emp
WHERE ename = 'ALLEN'
