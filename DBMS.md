# PostgreSQL

```
docker run --rm -d \
  -p 5432:5432 \
  -e POSTGRES_USER=testuser \
  -e POSTGRES_PASSWORD=passw0rd \
  -e POSTGRES_DB=testdb \
  postgres:14
```

# Db2

```
docker run -d \
  --privileged=true \
  -p 50000:50000 \
  -e LICENSE=accept \
  -e DB2INST1_PASSWORD=passw0rd \
  -e DBNAME=testdb \
  ibmcom/db2:11.5.7.0

docker exec -it <containerid> su - db2inst1
db2 -tv
connect to testdb user db2inst1 using passw0rd;
```

# SQLServer

```
docker run --rm -d \
  -p 1433:1433 \
  -e ACCEPT_EULA=Y \
  -e SA_PASSWORD=1234@Hoge \
  mcr.microsoft.com/mssql/server:2019-latest
```

# Oracle

以下の手順にしたがって環境が構築済みであることが前提。

https://github.com/oracle/docker-images/blob/main/OracleDatabase/SingleInstance/README.md

```
docker run -d \
  -p 1521:1521 \
  -p 5500:5500 \
  -e ORACLE_PWD=passw0rd \
  -e ORACLE_PDB=testdb \
  oracle/database:19.3.0-se2
```