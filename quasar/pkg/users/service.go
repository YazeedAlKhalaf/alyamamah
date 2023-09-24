package users

import (
	"context"
	"errors"
	"fmt"

	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/alyamamah/client"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/users/store"
	"github.com/rs/zerolog/log"
)

type Service interface {
	CreateUser(ctx context.Context, username string, password string, fcmToken string) (*User, error)
	GetUserByUsername(ctx context.Context, username string) (*User, error)
	UpdateFcmTokenByUsername(ctx context.Context, username string, fcmToken string) (*User, error)
}

type service struct {
	store           store.Store
	alyamamahClient client.Client
}

func (s *service) CreateUser(ctx context.Context, username string, password string, fcmToken string) (*User, error) {

	resp, err := s.alyamamahClient.Login(&client.LoginRequest{
		Username: username,
		Password: password,
	})
	if err != nil {
		log.Ctx(ctx).Err(err).Str("username", username).Msg("failed to login with al yamamah client")
		return nil, errors.New(fmt.Sprintf("failed to login with al yamamah client: %v", err))
	}

	if resp.CommonInfo.Status == false {
		log.Ctx(ctx).Err(err).Str("username", username).Msg("login failed")
		return nil, errors.New("login failed")
	}

	user, err := s.store.CreateUser(ctx, username, fcmToken)
	if err != nil {
		log.Ctx(ctx).Err(err).Str("username", username).Msg("failed to create user in store")
		return nil, errors.New(fmt.Sprintf("failed to create user in store: %v", err))
	}

	return &User{
		ID:       user.ID.String(),
		Username: user.Username,
		FcmToken: user.FcmToken.String,
	}, nil
}

func (s *service) GetUserByUsername(ctx context.Context, username string) (*User, error) {
	user, err := s.store.GetUserByUsername(ctx, username)
	if err != nil {
		log.Ctx(ctx).Err(err).Str("username", username).Msg("failed to get user by username from store")
		return nil, errors.New(fmt.Sprintf("failed to get user by username from store: %v", err))
	}

	if user == nil {
		return nil, nil
	}

	return &User{
		ID:       user.ID.String(),
		Username: user.Username,
		FcmToken: user.FcmToken.String,
	}, nil
}

func (s *service) UpdateFcmTokenByUsername(ctx context.Context, username string, fcmToken string) (*User, error) {
	user, err := s.store.UpdateFcmTokenByUsername(ctx, username, fcmToken)
	if err != nil {
		log.Ctx(ctx).Err(err).Str("username", username).Msg("failed to update fcm token by username in store")
		return nil, errors.New(fmt.Sprintf("failed to update fcm token by username in store: %v", err))
	}

	return &User{
		ID:       user.ID.String(),
		Username: user.Username,
		FcmToken: user.FcmToken.String,
	}, nil
}

func NewService(store store.Store, alyamamahClient client.Client) Service {
	return &service{
		store:           store,
		alyamamahClient: alyamamahClient,
	}
}
