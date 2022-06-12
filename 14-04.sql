-- Oracle
WITH T (val) AS (
            SELECT 'xxxxxabc[867]xxx[-]xxxx[5309]xxxxx' FROM DUAL
  UNION ALL SELECT 'xxxxxtime:[11271978]favnum:[4]id:[Joe]xxxxx'FROM DUAL
  UNION ALL SELECT 'call:[F_GET_ROWS()]b1:[ROSEWOOD…SIR]b2:[44400002]77.90xxxxx' FROM DUAL
  UNION ALL SELECT 'film:[non_marked]qq:[unit]tailpipe:[withabanana?]80sxxxxx' FROM DUAL
) 
SELECT 
  SUBSTR(val, INSTR(val,'[',1,1)+1, INSTR(val,']',1,1)-INSTR(val,'[',1,1)-1) AS first_val,
  SUBSTR(val, INSTR(val,'[',1,2)+1, INSTR(val,']',1,2)-INSTR(val,'[',1,2)-1) AS second_val,
  SUBSTR(val, INSTR(val,'[',1,3)+1, INSTR(val,']',1,3)-INSTR(val,'[',1,3)-1) AS third_val
FROM T
