/**
docker run -d \
  --privileged=true \
  -p 50000:50000 \
  -e LICENSE=accept \
  -e DB2INST1_PASSWORD=passw0rd \
  -e DBNAME=testdb \
  ibmcom/db2:11.5.7.0

docker exec -it <containerid> su - db2inst1
db2 -t
connect to testdb user db2inst1 using passw0rd;
**/

DROP TABLE IF EXISTS employee_comment;
CREATE TABLE employee_comment (emp_id INT, text VARCHAR(1000));
INSERT INTO employee_comment VALUES (7369, '126 Varnum, Edmore MI 48829, 989 313-5351');
INSERT INTO employee_comment VALUES (7499, 
  '1105 McConnell Court' || CHR(10) ||
  'Cedar Lake MI 48812'  || CHR(10) ||
  'Home: 989-387-4321'   || CHR(10) ||
  'Cell: (237) 438-3333' || CHR(10)
);
INSERT INTO employee_comment VALUES(7844, '989-387.5359');
INSERT INTO employee_comment VALUES(9999, '906-387-1698, 313-535.8886');

SELECT * 
FROM employee_comment
WHERE REGEXP_LIKE(text, '[0-9]{3}[-. ][0-9]{3}[-. ][0-9]{4}')
AND REGEXP_LIKE(REGEXP_REPLACE(text, '[0-9]{3}([-. ])[0-9]{3}\1[0-9]{4}', '***'), '[0-9]{3}[-. ][0-9]{3}[-. ][0-9]{4}');
