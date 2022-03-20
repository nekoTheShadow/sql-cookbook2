SELECT empno, ename, sal, EXP(SUM(LN(sal)) OVER (ORDER BY sal, empno)) 
FROM emp
WHERE deptno = 10;
