// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.21.0
// source: feedback.sql

package sqlc

import (
	"context"
	"database/sql"

	"github.com/google/uuid"
)

const createFeedback = `-- name: CreateFeedback :one
INSERT INTO feedback (user_id, category_id, title, body, student_id, student_name, student_email, student_phone, student_major, student_join_semester, student_current_semester, student_gender, student_remaining_hours, student_taken_hours, student_total_hours)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)
RETURNING id, user_id, category_id, title, body, created_at, updated_at, student_id, student_name, student_email, student_phone, student_major, student_join_semester, student_current_semester, student_gender, student_remaining_hours, student_taken_hours, student_total_hours
`

type CreateFeedbackParams struct {
	UserID                 uuid.UUID
	CategoryID             uuid.UUID
	Title                  string
	Body                   string
	StudentID              sql.NullString
	StudentName            sql.NullString
	StudentEmail           sql.NullString
	StudentPhone           sql.NullString
	StudentMajor           sql.NullString
	StudentJoinSemester    sql.NullString
	StudentCurrentSemester sql.NullString
	StudentGender          sql.NullString
	StudentRemainingHours  sql.NullInt32
	StudentTakenHours      sql.NullInt32
	StudentTotalHours      sql.NullInt32
}

func (q *Queries) CreateFeedback(ctx context.Context, arg CreateFeedbackParams) (Feedback, error) {
	row := q.db.QueryRowContext(ctx, createFeedback,
		arg.UserID,
		arg.CategoryID,
		arg.Title,
		arg.Body,
		arg.StudentID,
		arg.StudentName,
		arg.StudentEmail,
		arg.StudentPhone,
		arg.StudentMajor,
		arg.StudentJoinSemester,
		arg.StudentCurrentSemester,
		arg.StudentGender,
		arg.StudentRemainingHours,
		arg.StudentTakenHours,
		arg.StudentTotalHours,
	)
	var i Feedback
	err := row.Scan(
		&i.ID,
		&i.UserID,
		&i.CategoryID,
		&i.Title,
		&i.Body,
		&i.CreatedAt,
		&i.UpdatedAt,
		&i.StudentID,
		&i.StudentName,
		&i.StudentEmail,
		&i.StudentPhone,
		&i.StudentMajor,
		&i.StudentJoinSemester,
		&i.StudentCurrentSemester,
		&i.StudentGender,
		&i.StudentRemainingHours,
		&i.StudentTakenHours,
		&i.StudentTotalHours,
	)
	return i, err
}

const getFeedbackById = `-- name: GetFeedbackById :one
SELECT id, user_id, category_id, title, body, created_at, updated_at, student_id, student_name, student_email, student_phone, student_major, student_join_semester, student_current_semester, student_gender, student_remaining_hours, student_taken_hours, student_total_hours FROM feedback
WHERE id = $1
`

func (q *Queries) GetFeedbackById(ctx context.Context, id uuid.UUID) (Feedback, error) {
	row := q.db.QueryRowContext(ctx, getFeedbackById, id)
	var i Feedback
	err := row.Scan(
		&i.ID,
		&i.UserID,
		&i.CategoryID,
		&i.Title,
		&i.Body,
		&i.CreatedAt,
		&i.UpdatedAt,
		&i.StudentID,
		&i.StudentName,
		&i.StudentEmail,
		&i.StudentPhone,
		&i.StudentMajor,
		&i.StudentJoinSemester,
		&i.StudentCurrentSemester,
		&i.StudentGender,
		&i.StudentRemainingHours,
		&i.StudentTakenHours,
		&i.StudentTotalHours,
	)
	return i, err
}

const listFeedbackByUserId = `-- name: ListFeedbackByUserId :many
SELECT id, user_id, category_id, title, body, created_at, updated_at, student_id, student_name, student_email, student_phone, student_major, student_join_semester, student_current_semester, student_gender, student_remaining_hours, student_taken_hours, student_total_hours FROM feedback
WHERE user_id = $1
ORDER BY created_at DESC
`

func (q *Queries) ListFeedbackByUserId(ctx context.Context, userID uuid.UUID) ([]Feedback, error) {
	rows, err := q.db.QueryContext(ctx, listFeedbackByUserId, userID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []Feedback
	for rows.Next() {
		var i Feedback
		if err := rows.Scan(
			&i.ID,
			&i.UserID,
			&i.CategoryID,
			&i.Title,
			&i.Body,
			&i.CreatedAt,
			&i.UpdatedAt,
			&i.StudentID,
			&i.StudentName,
			&i.StudentEmail,
			&i.StudentPhone,
			&i.StudentMajor,
			&i.StudentJoinSemester,
			&i.StudentCurrentSemester,
			&i.StudentGender,
			&i.StudentRemainingHours,
			&i.StudentTakenHours,
			&i.StudentTotalHours,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}