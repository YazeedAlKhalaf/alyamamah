-- Drop the trigger from the feedback table
DROP TRIGGER IF EXISTS update_feedback_updated_at ON feedback;

-- Drop the trigger function
DROP FUNCTION IF EXISTS update_modified_column();

-- Drop the feedback table
DROP TABLE IF EXISTS feedback;

-- Drop the feedback_category table
DROP TABLE IF EXISTS feedback_category;

-- Disable the uuid extension
DROP EXTENSION IF EXISTS "uuid-ossp";
