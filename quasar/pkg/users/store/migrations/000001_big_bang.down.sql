-- Drop the trigger from the users table
DROP TRIGGER IF EXISTS update_users_updated_at ON users;

-- Drop the trigger function
DROP FUNCTION IF EXISTS update_modified_column();

-- Drop the users table
DROP TABLE IF EXISTS users;

-- Disable the uuid extension
DROP EXTENSION IF EXISTS "uuid-ossp";
