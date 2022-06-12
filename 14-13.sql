-- Oracle
DROP VIEW V;
CREATE VIEW V (student_id, test_id, grade_id, period_id, test_date, pass_fail) AS
            SELECT 1, 1, 2, 1, TO_DATE('02/01/2020','MM/DD/YYYY'), 0 FROM DUAL
  UNION ALL SELECT 1, 2, 2, 1, TO_DATE('03/01/2020','MM/DD/YYYY'), 1 FROM DUAL
  UNION ALL SELECT 1, 3, 2, 1, TO_DATE('04/01/2020','MM/DD/YYYY'), 0 FROM DUAL
  UNION ALL SELECT 1, 4, 2, 2, TO_DATE('05/01/2020','MM/DD/YYYY'), 0 FROM DUAL
  UNION ALL SELECT 1, 5, 2, 2, TO_DATE('06/01/2020','MM/DD/YYYY'), 0 FROM DUAL
  UNION ALL SELECT 1, 6, 2, 2, TO_DATE('07/01/2020','MM/DD/YYYY'), 0 FROM DUAL;

SELECT
  student_id,
  test_id,
  grade_id,
  period_id,
  test_date,
  CASE grp_p_f WHEN 1 THEN lpad('+', 6) ELSE lpad('-', 6) END AS metreq,
  CASE WHEN grp_p_f = 0 AND test_date = last_test THEN 1 ELSE 0 END AS in_progress
FROM (
  SELECT 
    V.*,
    MAX(pass_fail) OVER (PARTITION BY student_id, grade_id, period_id) grp_p_f,
    MAX(test_date) OVER (PARTITION BY student_id, grade_id, period_id) last_test
  FROM V
) X
