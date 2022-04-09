WITH RECURSIVE cal (q_start) AS (
    SELECT DATE_TRUNC('YEAR', CURRENT_TIMESTAMP)
  UNION ALL
    SELECT q_start + INTERVAL '3 month'
    FROM cal
    WHERE EXTRACT(YEAR FROM q_start) = EXTRACT(YEAR FROM q_start + INTERVAL '3 month')
)
SELECT 
  ROW_NUMBER() OVER(ORDER BY q_start) AS qtr,
  q_start,
  q_start + INTERVAL '3 month' - INTERVAL '1 day' AS q_end
FROM cal;
