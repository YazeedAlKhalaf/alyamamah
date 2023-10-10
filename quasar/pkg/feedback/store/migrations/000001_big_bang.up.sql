-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create feedback_category table
CREATE TABLE feedback_category (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    name_ar TEXT NOT NULL,
    name_en TEXT NOT NULL
);

-- Create feedback table
CREATE TABLE feedback (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID NOT NULL,
    category_id UUID REFERENCES feedback_category(id) NOT NULL,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Create a trigger function to update the updated_at column
CREATE OR REPLACE FUNCTION update_modified_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Add the trigger to the feedback table
CREATE TRIGGER update_feedback_updated_at
BEFORE UPDATE ON feedback
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
