SELECT (LENGTH(word) - LENGTH(REPLACE(word, ',', ''))) / LENGTH(',')
FROM (VALUES ('10,CLARK,MANAGER')) AS T (word)
