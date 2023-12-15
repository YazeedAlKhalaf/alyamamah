-- name: ListFeedbackStatusHistoryByFeedbackId :many
SELECT fs.id, fs.name_ar, fs.name_en, fsh.created_at FROM feedback_status_history AS fsh
JOIN feedback_status AS fs ON fsh.feedback_status_id = fs.id
WHERE fsh.feedback_id = $1
ORDER BY created_at DESC;