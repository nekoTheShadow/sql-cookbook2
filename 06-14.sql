DROP VIEW IF EXISTS V;
CREATE VIEW V (name) AS VALUES ('mo,larry,curly'), ('tina,gina,jaunita,regina,leena');

SELECT SPLIT_PART(name, ',', 2) FROM V;
