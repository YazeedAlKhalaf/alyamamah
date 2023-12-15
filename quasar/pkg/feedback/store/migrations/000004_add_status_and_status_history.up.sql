-- Create feedback_status table
CREATE TABLE feedback_status (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    name_ar TEXT NOT NULL,
    name_en TEXT NOT NULL
);

-- Create feedback_status_history table
CREATE TABLE feedback_status_history (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    feedback_id UUID REFERENCES feedback(id) NOT NULL,
    status_id UUID REFERENCES feedback_status(id) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Create a trigger function to create the initial feedback status
CREATE OR REPLACE FUNCTION create_initial_feedback_status()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO feedback_status_history (feedback_id, status_id, created_at)
    -- TODO: fill with id of the initial status, once seed data is created.
    VALUES (NEW.id, '2c0d4bb4-0a9e-4173-a8fa-2890f7aaef66', now());
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Add the trigger to the feedback table
CREATE TRIGGER trigger_feedback_after_insert
AFTER INSERT ON feedback
FOR EACH ROW
EXECUTE FUNCTION create_initial_feedback_status();