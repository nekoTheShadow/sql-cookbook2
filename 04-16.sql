DROP TABLE IF EXISTS dupes;
CREATE TABLE dupes (id INTEGER, name VARCHAR(10));
INSERT INTO dupes VALUES (1, 'NAPOLEON');
INSERT INTO dupes VALUES (2, 'DYNAMITE');
INSERT INTO dupes VALUES (3, 'DYNAMITE');
INSERT INTO dupes VALUES (4, 'SHE SELLS');
INSERT INTO dupes VALUES (5, 'SHE SELLS');
INSERT INTO dupes VALUES (6, 'SHE SELLS');
INSERT INTO dupes VALUES (7, 'SHE SELLS');

DELETE FROM dupes
WHERE id NOT IN (SELECT MIN(id)FROM dupes GROUP BY name);
SELECT * FROM dupes ORDER BY id;


