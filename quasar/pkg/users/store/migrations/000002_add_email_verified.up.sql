ALTER TABLE users ADD COLUMN is_email_verified BOOLEAN NOT NULL DEFAULT false;

UPDATE users SET is_email_verified = true;

CREATE TABLE verify_email (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    username VARCHAR(255) REFERENCES users(username) ON DELETE CASCADE NOT NULL,
    token CHAR(6) UNIQUE NOT NULL,
    expires_at TIMESTAMPTZ NOT NULL,
    used_at TIMESTAMPTZ NULL,

    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Add the trigger to the verify_email table
CREATE TRIGGER update_verify_email_updated_at
BEFORE UPDATE ON verify_email
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();