# Quasar 🌌

Al Yamamah's powerful backend written in Golang.

## Requirements 🛠

- Golang: https://go.dev/
- Taskfile: https://taskfile.dev/
- protoc: https://grpc.io/docs/protoc-installation/ (v24.3)
- migrate: https://github.com/golang-migrate/migrate
- sqlc: https://docs.sqlc.dev/en/stable/overview/install.html
- mockery `go install github.com/vektra/mockery/v2@v2.33.2`

Before generating from the proto files, run:

```
go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.31.0
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.3.0
```

## Getting Started 🚀

1. Clone the main repository if you haven't already.
2. Navigate to the `quasar` directory.
3. Install the necessary dependencies.
4. Run the application using:

```
task run
```

## Database Setup

Utilize the `docker-compose.yaml` file to get a local Postgres DB up. Start with:

```
docker compose up -d
```

NOTE: The DB may fail the first time, but once PostgreSQL is up, access and create the required databases. After the setup, run the command again.

Required databases:

```
CREATE DATABASE users;
CREATE DATABASE feedback;
```

## To generate a new migration for a specific service

Use the command below, just replace the env variables with your values.
This command is for users service, for other new services you need to create another command that points to the service's path.

```
MIG_NAME=new_column task new-mig-users
```

## JWT Token Keys Generation:

Start by generating the key using openssl:

```
openssl genpkey -algorithm RSA -out quasar-dev-private.pem -pkeyopt rsa_keygen_bits:4096
openssl rsa -pubout -in quasar-dev-private.pem -out quasar-dev-public.pem
base64 -i quasar-dev-public.pem -o quasar-dev-public.pem.base64
base64 -i quasar-dev-private.pem -o quasar-dev-private.pem.base64
```

Finally just update you `app.env` file with the keys.

For additional steps and details, consult the main repository's README.
