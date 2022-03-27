WITH 
A (first_digit) AS (SELECT CAST(CAST(sal AS CHAR) AS INT) FROM emp),
B (total) AS (SELECT COUNT(*)*1.0  FROM emp),
C (digit, expected) AS (SELECT id, (LOG10(id+1)-LOG10(id)) FROM t10 WHERE id < 10)
SELECT 
  COUNT(A.first_digit),
  C.digit,
  COALESCE(COUNT(*)/(SELECT * FROM B), 0) AS actual_proportion,
  MAX(expected) AS expected
FROM A
JOIN C ON A.first_digit = C.digit
GROUP BY A.first_digit, C.digit
ORDER BY C.digit
