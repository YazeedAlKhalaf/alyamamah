package store

import (
	"context"
	"database/sql"

	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/feedback/store/sqlc"
	"github.com/google/uuid"
	"github.com/rs/zerolog/log"
)

type Store interface {
	CreateFeedback(ctx context.Context, userID uuid.UUID, categoryID uuid.UUID, title string, body string) (*sqlc.Feedback, error)
	GetFeedbackById(ctx context.Context, id uuid.UUID) (*sqlc.Feedback, error)
	ListFeedbackByUserId(ctx context.Context, userID uuid.UUID) ([]*sqlc.Feedback, error)

	ListFeedbackCategory(ctx context.Context) ([]*sqlc.FeedbackCategory, error)
}

type store struct {
	queries sqlc.Queries
}

func (s *store) CreateFeedback(ctx context.Context, userID uuid.UUID, categoryID uuid.UUID, title string, body string) (*sqlc.Feedback, error) {
	f, err := s.queries.CreateFeedback(ctx, sqlc.CreateFeedbackParams{
		UserID:     userID,
		CategoryID: categoryID,
		Title:      title,
		Body:       body,
	})
	if err != nil {
		log.Ctx(ctx).Err(err).Msg("couldn't create feedback")
		return nil, err
	}

	return &f, nil
}

func (s *store) GetFeedbackById(ctx context.Context, id uuid.UUID) (*sqlc.Feedback, error) {
	f, err := s.queries.GetFeedbackById(ctx, id)
	if err != nil {
		log.Ctx(ctx).Err(err).Msg("couldn't get feedback by id")
		return nil, err
	}

	return &f, nil
}

func (s *store) ListFeedbackByUserId(ctx context.Context, userID uuid.UUID) ([]*sqlc.Feedback, error) {
	f, err := s.queries.ListFeedbackByUserId(ctx, userID)
	if err != nil {
		log.Ctx(ctx).Err(err).Msg("couldn't list feedback by user id")
		return nil, err
	}

	fp := make([]*sqlc.Feedback, len(f))
	for i := range f {
		fp[i] = &f[i]
	}

	return fp, nil
}

func (s *store) ListFeedbackCategory(ctx context.Context) ([]*sqlc.FeedbackCategory, error) {
	fc, err := s.queries.ListFeedbackCategory(ctx)
	if err != nil {
		log.Ctx(ctx).Err(err).Msg("couldn't list feedback category")
		return nil, err
	}

	fcp := make([]*sqlc.FeedbackCategory, len(fc))
	for i := range fc {
		fcp[i] = &fc[i]
	}

	return fcp, nil
}

func NewStore(conn *sql.DB) Store {
	return &store{
		queries: *sqlc.New(conn),
	}
}
