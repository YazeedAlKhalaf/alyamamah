-- Drop the modified foreign key constraint
ALTER TABLE feedback_status_history DROP CONSTRAINT IF EXISTS feedback_status_history_feedback_id_fkey;

-- Re-add the original foreign key constraint without ON DELETE CASCADE
ALTER TABLE feedback_status_history
ADD CONSTRAINT feedback_status_history_feedback_id_fkey
FOREIGN KEY (feedback_id) REFERENCES feedback(id);