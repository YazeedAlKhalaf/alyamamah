// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.21.0
// source: feedback_status.sql

package sqlc

import (
	"context"
)

const listFeedbackStatus = `-- name: ListFeedbackStatus :many
SELECT id, name_ar, name_en FROM feedback_status
`

func (q *Queries) ListFeedbackStatus(ctx context.Context) ([]FeedbackStatus, error) {
	rows, err := q.db.QueryContext(ctx, listFeedbackStatus)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []FeedbackStatus
	for rows.Next() {
		var i FeedbackStatus
		if err := rows.Scan(&i.ID, &i.NameAr, &i.NameEn); err != nil {
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
