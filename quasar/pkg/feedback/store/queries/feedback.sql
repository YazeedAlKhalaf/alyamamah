-- name: CreateFeedback :one
INSERT INTO feedback (user_id, category_id, title, body, student_id, student_name, student_email, student_phone, student_major, student_join_semester, student_current_semester, student_gender, student_remaining_hours, student_taken_hours, student_total_hours)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)
RETURNING *;

-- name: GetFeedbackById :one
SELECT * FROM feedback
WHERE id = $1;

-- name: ListFeedbackByUserId :many
SELECT * FROM feedback
WHERE user_id = $1
ORDER BY created_at DESC;
