-- Drop the trigger from the feedback table
DROP TRIGGER IF EXISTS trigger_feedback_after_insert ON feedback;

-- Drop the trigger function
DROP FUNCTION IF EXISTS create_initial_feedback_status;

-- Drop the feedback_status_history table
DROP TABLE IF EXISTS feedback_status_history;

-- Drop the feedback_status table
DROP TABLE IF EXISTS feedback_status;