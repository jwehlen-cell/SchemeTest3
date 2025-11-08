-- Test table creation
CREATE TABLE test_table (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert test data
INSERT INTO test_table (name) VALUES ('USNDC Test');

-- Check the table
SELECT * FROM test_table;