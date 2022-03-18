SELECT ename FROM emp ORDER BY SUBSTRING(ename FROM '..$');

SELECT ename FROM emp ORDER BY SUBSTR(ename, LENGTH(ename)-1);
