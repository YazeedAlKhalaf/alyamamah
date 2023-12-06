-- name: CreateFeedback :one
INSERT INTO feedback (user_id, category_id, title, body, student_id, student_name, student_email, student_phone)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
RETURNING *;

-- name: GetFeedbackById :one
SELECT * FROM feedback
WHERE id = $1;

-- name: ListFeedbackByUserId :many
SELECT * FROM feedback
WHERE user_id = $1
ORDER BY created_at DESC;
