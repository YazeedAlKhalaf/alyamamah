// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.21.0
// source: feedback_status_history.sql

package sqlc

import (
	"context"
	"time"

	"github.com/google/uuid"
)

const listFeedbackStatusHistoryByFeedbackId = `-- name: ListFeedbackStatusHistoryByFeedbackId :many
SELECT fs.id, fs.name_ar, fs.name_en, fsh.created_at FROM feedback_status_history AS fsh
JOIN feedback_status AS fs ON fsh.status_id = fs.id
WHERE fsh.feedback_id = $1
ORDER BY created_at DESC
`

type ListFeedbackStatusHistoryByFeedbackIdRow struct {
	ID        uuid.UUID
	NameAr    string
	NameEn    string
	CreatedAt time.Time
}

func (q *Queries) ListFeedbackStatusHistoryByFeedbackId(ctx context.Context, feedbackID uuid.UUID) ([]ListFeedbackStatusHistoryByFeedbackIdRow, error) {
	rows, err := q.db.QueryContext(ctx, listFeedbackStatusHistoryByFeedbackId, feedbackID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []ListFeedbackStatusHistoryByFeedbackIdRow
	for rows.Next() {
		var i ListFeedbackStatusHistoryByFeedbackIdRow
		if err := rows.Scan(
			&i.ID,
			&i.NameAr,
			&i.NameEn,
			&i.CreatedAt,
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
