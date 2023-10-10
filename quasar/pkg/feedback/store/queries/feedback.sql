-- name: CreateFeedback :one
INSERT INTO feedback (user_id, category_id, title, body)
VALUES ($1, $2, $3, $4)
RETURNING *;

-- name: GetFeedbackById :one
SELECT * FROM feedback
WHERE id = $1;

-- name: ListFeedbackByUserId :many
SELECT * FROM feedback
WHERE user_id = $1
ORDER BY created_at DESC;
