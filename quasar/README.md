# Quasar 🌌

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

1. Clone the repository.
2. Navigate to the `quasar` folder, which this README is inside.
3. Install the necessary dependencies.
4. Run the application using `go run cmd/main.go`.

## To generate a new migration for a specific service

Use the command below, just replace the env variables with your values.
This command is for users service, for other new services you need to create another command that points to the service's path.

```
MIG_NAME=new_column task new-mig-users
```

## DB stuff

You can use the docker-compose.yaml file to get a local postgres db up and running.

Then you have to run this manually, before doing anything:

```
CREATE DATABASE alyamamah;
```

## To run the app easily

Just run:

```
docker compose up -d
```

It will fail the first time but postgres is up, you have to access it and create the required DBs above. After that you just run the command again and it will run:

```
docker compose up -d
```

## To make a key for JWT token issuing

Start by generating the key using openssl:

```
openssl genpkey -algorithm RSA -out quasar-dev-private.pem -pkeyopt rsa_keygen_bits:4096
```

Then you can get the public key:

```
openssl rsa -pubout -in quasar-dev-private.pem -out quasar-dev-public.pem
```

And the private key is already there, it is the `.pem` file you made.

The next step is to encode the keys you have to base64:

**public:**

```
base64 -i quasar-dev-public.pem -o quasar-dev-public.pem.base64
```

**private:**

```
base64 -i quasar-dev-private.pem -o quasar-dev-private.pem.base64
```

Finally, you just copy them to the app.env file
