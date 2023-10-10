package store

import (
	"context"
	"database/sql"

	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/users/store/sqlc"
)

type Store interface {
	CreateUser(ctx context.Context, username string, fcmToken string) (*sqlc.User, error)
	GetUserByUsername(ctx context.Context, username string) (*sqlc.User, error)
	UpdateFcmTokenByUsername(ctx context.Context, username string, fcmToken string) (*sqlc.User, error)
}

type store struct {
	queries sqlc.Queries
}

func (s *store) CreateUser(ctx context.Context, username string, fcmToken string) (*sqlc.User, error) {
	user, err := s.queries.CreateUser(ctx, sqlc.CreateUserParams{
		Username: username,
		FcmToken: sql.NullString{
			String: fcmToken,
			Valid:  true,
		},
	})
	if err != nil {
		return nil, err
	}

	return &user, nil
}

func (s *store) GetUserByUsername(ctx context.Context, username string) (*sqlc.User, error) {
	user, err := s.queries.GetUserByUsername(ctx, username)
	if err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &user, nil
}

func (s *store) UpdateFcmTokenByUsername(ctx context.Context, username string, fcmToken string) (*sqlc.User, error) {
	user, err := s.queries.UpdateFcmTokenByUsername(ctx, sqlc.UpdateFcmTokenByUsernameParams{
		Username: username,
		FcmToken: sql.NullString{
			String: fcmToken,
			Valid:  true,
		},
	})
	if err != nil {
		return nil, err
	}

	return &user, nil
}

func NewStore(conn *sql.DB) Store {
	return &store{
		queries: *sqlc.New(conn),
	}
}
