WITH RECURSIVE cal (dy) AS (
    SELECT DATE_TRUNC('month', CURRENT_TIMESTAMP)
  UNION ALL
    SELECT dy + '1 day'
    FROM cal
    WHERE EXTRACT(MONTH FROM dy) = EXTRACT(MONTH FROM dy + '1 day')
)
SELECT MIN(dy) AS first_monday, MAX(dy) AS last_monday
FROM cal
WHERE EXTRACT(DOW FROM dy) = 1
