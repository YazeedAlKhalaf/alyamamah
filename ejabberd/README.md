# 💬 ejabberd

You need to run the `scripts/get_default_config.sh` script to get a brand new config file that is untouched.

SQL Schema: https://docs.ejabberd.im/developer/sql-schema/
PostgreSQL Schema: https://github.com/processone/ejabberd/blob/master/sql/pg.sql

### 👨‍💻 Commands to initialize the database for ejabberd:

Run those SQL commands in order:

```
CREATE DATABASE ejabberd;
CREATE USER ejabberd_svc WITH ENCRYPTED PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE ejabberd TO ejabberd_svc;
ALTER DATABASE ejabberd OWNER TO ejabberd_svc;
```

then you should have [migrate](https://github.com/golang-migrate/migrate) tool to run migrations:

1. Replace the placeholders with your data:

> You need to run the docker compose file in the `backend/` folder.

```
export POSTGRESQL_URL='postgres://ejabberd_svc:password@localhost:5432/ejabberd?sslmode=disable'
```

2. Run the migrations up:

```
migrate -database ${POSTGRESQL_URL} -path db/migrations up
```

### 🐟 After running the above commands, you can run the app in docker:

```
docker compose build
docker compose up -d
```

The yq commands I use format the file in a way and replace the env placeholders, kindly revert the changes that remove the placeholders before pushing any commits.

### ⬆️ Next Steps:

- create a user with this command from inside the container: `ejabberdctl register admin localhost password`

## Generate certs

Run this inside certs after deleting its contents:

```
openssl req -x509 -newkey rsa:4096 -keyout localhost.key -out localhost.pem -days 3650 -nodes -config localhost.cnf
```

Then change the extensions to `.pem`

## 📚 References:

- Dockefile of ejabberd/ecs package: https://github.com/processone/docker-ejabberd/blob/master/ecs/Dockerfile
