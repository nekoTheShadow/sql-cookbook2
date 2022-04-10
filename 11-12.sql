WITH V (id, ordered_date, process_date) AS (
            SELECT 1, TO_DATE('25-SEP-2005', 'DD-MON-YYYY'), TO_DATE('27-SEP-2005', 'DD-MON-YYYY')
  UNION ALL SELECT 2, TO_DATE('26-SEP-2005', 'DD-MON-YYYY'), TO_DATE('28-SEP-2005', 'DD-MON-YYYY')
  UNION ALL SELECT 3, TO_DATE('27-SEP-2005', 'DD-MON-YYYY'), TO_DATE('29-SEP-2005', 'DD-MON-YYYY')
)
SELECT id, ordered_date, process_date, verified, shipped
FROM (
            SELECT id, ordered_date, process_date, process_date + 1, process_date + 2, 3 FROM V
  UNION ALL SELECT id, ordered_date, process_date, process_date + 1, NULL,             2 FROM V
  UNION ALL SELECT id, ordered_date, process_date, NULL,             NULL,             1 FROM V

) T (id, ordered_date, process_date, verified, shipped, seq)
ORDER BY id, seq
