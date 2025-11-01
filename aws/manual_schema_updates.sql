-- Manual NDC PLUS Schema Updates
-- Add specifically missing columns identified from schema review

-- Add EVID column to EVENT table
ALTER TABLE event ADD COLUMN evid BIGINT;

COMMIT;