-- Oracle
WITH T (val) AS (
            SELECT 'entry:stewiegriffin:lois:brian:' FROM DUAL
  UNION ALL SELECT 'entry:moe::sizlack:' FROM DUAL
  UNION ALL SELECT 'entry:petergriffin:meg:chris:' FROM DUAL
  UNION ALL SELECT 'entry:willie:' FROM DUAL
  UNION ALL SELECT 'entry:quagmire:mayorwest:cleveland:' FROM DUAL
  UNION ALL SELECT 'entry:::flanders:' FROM DUAL
  UNION ALL SELECT 'entry:robo:tchi:ken:' FROM DUAL
)
SELECT 
  SUBSTR(val, INSTR(val,':',1,1)+1, INSTR(val,':',1,2)-INSTR(val,':',1,1)-1) val1,
  SUBSTR(val, INSTR(val,':',1,2)+1, INSTR(val,':',1,3)-INSTR(val,':',1,2)-1) val2,
  SUBSTR(val, INSTR(val,':',1,3)+1, INSTR(val,':',1,4)-INSTR(val,':',1,3)-1) val3
FROM T;


