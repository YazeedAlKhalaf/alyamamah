-- name: CreateFeedbackCategory :one
INSERT INTO feedback_category (name_ar, name_en)
VALUES ($1, $2)
RETURNING *;

-- name: ListFeedbackCategory :many
SELECT * FROM feedback_category;