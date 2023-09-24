package auth

import (
	"context"

	authpb "github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/api/proto"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/audience"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/quasarmetadata"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/tokens"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/users"
	"github.com/rs/zerolog/log"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

const (
	usernameKey = "username"
)

type server struct {
	authpb.UnimplementedAuthServer

	tokens   tokens.Tokens
	qmd      quasarmetadata.QuasarMetadata
	usersSvc users.Service
}

func (s *server) Login(ctx context.Context, r *authpb.LoginRequest) (*authpb.LoginResponse, error) {
	if len(r.Username) == 0 || len(r.Password) == 0 || len(r.FcmToken) == 0 {
		return nil, status.Error(codes.InvalidArgument, "username, password, or fcm token is empty.")
	}

	user, err := s.usersSvc.GetUserByUsername(ctx, r.Username)
	if err != nil {
		log.Ctx(ctx).Err(err).Str(usernameKey, r.Username).Msg("couldn't get user")
		return nil, status.Error(codes.Internal, "something went wrong")
	}

	if user == nil {
		user, err = s.usersSvc.CreateUser(ctx, r.Username, r.Password, r.FcmToken)
		if err != nil {
			log.Ctx(ctx).Err(err).Str(usernameKey, r.Username).Msg("couldn't create user")
			return nil, status.Error(codes.Internal, "something went wrong")
		}
	}

	if user != nil {
		user, err = s.usersSvc.UpdateFcmTokenByUsername(ctx, r.Username, r.FcmToken)
		if err != nil {
			log.Ctx(ctx).Err(err).Str(usernameKey, r.Username).Msg("couldn't update user")
			return nil, status.Error(codes.Internal, "something went wrong")
		}
	}

	token, err := s.tokens.NewToken(r.Username, audience.AudienceAlYamamah)
	if err != nil {
		log.Ctx(ctx).Err(err).Str(usernameKey, r.Username).Msg("couldn't generate token for user with username:")
		return nil, status.Error(codes.Internal, "something went wrong")
	}

	return &authpb.LoginResponse{
		AccessToken: *token,
	}, nil
}

func NewServer(tokens tokens.Tokens, qmd quasarmetadata.QuasarMetadata, usersSvc users.Service) authpb.AuthServer {
	return &server{
		tokens:   tokens,
		qmd:      qmd,
		usersSvc: usersSvc,
	}
}
