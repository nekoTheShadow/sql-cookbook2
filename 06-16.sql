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

WITH V (a_name) AS (
  VALUES ('Johnson'),
         ('Jonson'),
         ('Jonsen'),
         ('Jensen'),
         ('Johnsen'),
         ('Shakespere'),
         ('Shakspear'),
         ('Shaekspir'),
         ('Shakespar')
)
SELECT V1.a_name, V2.a_name, SOUNDEX(V1.a_name)
FROM V AS V1
JOIN V AS V2 ON V1.a_name <= V2.a_name
WHERE SOUNDEX(V1.a_name) = SOUNDEX(V2.a_name);
