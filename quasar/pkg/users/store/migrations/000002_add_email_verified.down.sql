ALTER TABLE users DROP COLUMN is_email_verified;

DROP TABLE IF EXISTS verify_email CASCADE;