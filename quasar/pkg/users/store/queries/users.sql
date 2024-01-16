-- name: CreateUser :one
INSERT INTO users (username, fcm_token)
VALUES ($1, $2)
RETURNING *;

-- name: GetUserByUsername :one
SELECT * FROM users WHERE username = $1;

-- name: UpdateFcmTokenByUsername :one
UPDATE users
SET fcm_token = $1
WHERE username = $2
RETURNING *;

-- name: UpdateIsEmailedVerifiedByUsername :one
UPDATE users
SET is_email_verified = $1
WHERE username = $2
RETURNING *;