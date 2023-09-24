package main

import (
	"database/sql"
	"fmt"
	"net"
	"net/http"

	alyamamahClient "github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/alyamamah/client"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/api/auth"
	authpb "github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/api/proto"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/interceptors"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/quasarmetadata"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/tokens"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/users"
	usersStore "github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/users/store"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/users/store/sqlc"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/util"
	"github.com/rs/zerolog/log"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"

	"github.com/golang-migrate/migrate"
	"github.com/golang-migrate/migrate/database/postgres"
	_ "github.com/golang-migrate/migrate/source/file"

	_ "github.com/jackc/pgx/v5/stdlib"
)

func main() {
	config, err := util.LoadConfig(".")
	if err != nil {
		log.Fatal().Msgf("cannot load config: %v", err)
	}

	usersDbSource := util.CreateDbSource(
		config.DBUser,
		config.DBPassword,
		config.DBHost,
		config.DBPort,
		"users",
		config.DBSSLMode,
	)
	usersConn, err := sql.Open(config.DBDriver, usersDbSource)
	if err != nil {
		log.Fatal().Msgf("cannot connect to postgres database: %v", err)
	}

	usersDriver, err := postgres.WithInstance(usersConn, &postgres.Config{})
	if err != nil {
		log.Fatal().Msgf("cannot create postgres db driver: %v", err)
	}

	migUsers, err := migrate.NewWithDatabaseInstance(
		"file://pkg/users/store/migrations",
		config.DBDriver,
		usersDriver,
	)
	if err != nil {
		log.Fatal().Msgf("cannot create alyamamah migration instance: %v", err)
	}

	err = migUsers.Up()
	if err != nil && err != migrate.ErrNoChange {
		log.Fatal().Msgf("cannot run alyamamah migrations up: %v", err)
	}

	alyamamahClient := alyamamahClient.NewClient(&http.Client{}, "https://edugate.yu.edu.sa/yu")
	quasarmetadata := quasarmetadata.NewQuasarMetadata()

	publicKey, err := tokens.ParseRSAPublicKey(config.JWTPublicKey)
	if err != nil {
		log.Fatal().Msgf("cannot parse public key: %v", err)
	}

	privateKey, err := tokens.ParseRSAPrivateKey(config.JWTPrivateKey)
	if err != nil {
		log.Fatal().Msgf("cannot parse private key: %v", err)
	}

	tokens := tokens.NewTokens(publicKey, privateKey)

	queries := sqlc.New(usersConn)

	usersSvcStore := usersStore.NewStore(*queries)
	usersSvc := users.NewService(usersSvcStore, alyamamahClient)

	lis, err := net.Listen("tcp", fmt.Sprintf("0.0.0.0:%s", config.Port))
	if err != nil {
		log.Fatal().Msgf("failed to listen: %v", err)
	}
	log.Info().Msgf("listening on %s", lis.Addr())

	opts := []grpc.ServerOption{
		grpc.ChainUnaryInterceptor(
			interceptors.LoggingInterceptor,
			interceptors.EnsureValidTokenInterceptor(tokens, quasarmetadata),
		),
	}

	grpcServer := grpc.NewServer(opts...)
	reflection.Register(grpcServer)

	authServer := auth.NewServer(tokens, quasarmetadata, usersSvc)
	authpb.RegisterAuthServer(grpcServer, authServer)

	if err = grpcServer.Serve(lis); err != nil {
		log.Fatal().Msgf("failed to serve: %s", err)
	}
}
