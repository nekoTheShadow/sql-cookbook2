SELECT SPLIT_PART(ipaddr, '.', 1) AS A,
       SPLIT_PART(ipaddr, '.', 2) AS B,
       SPLIT_PART(ipaddr, '.', 3) AS C,
       SPLIT_PART(ipaddr, '.', 4) AS D
FROM (VALUES ('111.22.3.4')) AS S (ipaddr)
