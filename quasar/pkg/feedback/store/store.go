package store

import (
	"context"
	"database/sql"
	"strings"

	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/feedback/store/sqlc"
	"github.com/google/uuid"
	"github.com/rs/zerolog/log"
)

type Store interface {
	CreateFeedback(ctx context.Context, userID uuid.UUID, categoryID uuid.UUID, title string, body string, studentId string, studentName string, studentEmail string, studentPhone string, studentMajor string, studentJoinSemester string, studentCurrentSemester string, studentGender string, studentRemainingHours int32, studentTakenHours int32, studentTotalHours int32) (*sqlc.Feedback, error)
	GetFeedbackById(ctx context.Context, id uuid.UUID) (*sqlc.Feedback, error)
	ListFeedbackByUserId(ctx context.Context, userID uuid.UUID) ([]*sqlc.Feedback, error)

	ListFeedbackCategory(ctx context.Context) ([]*sqlc.FeedbackCategory, error)
}

type store struct {
	queries sqlc.Queries
}

func (s *store) CreateFeedback(ctx context.Context, userID uuid.UUID, categoryID uuid.UUID, title string, body string, studentId string, studentName string, studentEmail string, studentPhone string, studentMajor string, studentJoinSemester string, studentCurrentSemester string, studentGender string, studentRemainingHours int32, studentTakenHours int32, studentTotalHours int32) (*sqlc.Feedback, error) {
	f, err := s.queries.CreateFeedback(ctx, sqlc.CreateFeedbackParams{
		UserID:                 userID,
		CategoryID:             categoryID,
		Title:                  title,
		Body:                   body,
		StudentID:              sql.NullString{String: strings.TrimSpace(studentId), Valid: len(strings.TrimSpace(studentId)) > 0},
		StudentName:            sql.NullString{String: strings.TrimSpace(studentName), Valid: len(strings.TrimSpace(studentName)) > 0},
		StudentEmail:           sql.NullString{String: strings.TrimSpace(studentEmail), Valid: len(strings.TrimSpace(studentEmail)) > 0},
		StudentPhone:           sql.NullString{String: strings.TrimSpace(studentPhone), Valid: len(strings.TrimSpace(studentPhone)) > 0},
		StudentMajor:           sql.NullString{String: strings.TrimSpace(studentMajor), Valid: len(strings.TrimSpace(studentMajor)) > 0},
		StudentJoinSemester:    sql.NullString{String: strings.TrimSpace(studentJoinSemester), Valid: len(strings.TrimSpace(studentJoinSemester)) > 0},
		StudentCurrentSemester: sql.NullString{String: strings.TrimSpace(studentCurrentSemester), Valid: len(strings.TrimSpace(studentCurrentSemester)) > 0},
		StudentGender:          sql.NullString{String: strings.TrimSpace(studentGender), Valid: len(strings.TrimSpace(studentGender)) > 0},
		StudentRemainingHours:  sql.NullInt32{Int32: studentRemainingHours, Valid: studentRemainingHours > 0},
		StudentTakenHours:      sql.NullInt32{Int32: studentTakenHours, Valid: studentTakenHours > 0},
		StudentTotalHours:      sql.NullInt32{Int32: studentTotalHours, Valid: studentTotalHours > 0},
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
