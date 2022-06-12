-- db2
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
