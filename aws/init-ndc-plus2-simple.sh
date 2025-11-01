#!/bin/bash

# Initialize NDC Plus 2 Database - Simple Schema Version
# Based on NDC_Plus2.mmd Mermaid diagram

set -e

echo "Initializing NDC Plus 2 Database with simple schema..."

# Database connection parameters
DB_HOST="ndc-plus2-schema.c0320kayk04f.us-east-1.rds.amazonaws.com"
DB_PORT="5432"
DB_NAME="ndc_plus2_schema"
DB_USER="schemaadmin"
export PGPASSWORD="SchemaTest2024!"

echo "Connecting to NDC Plus 2 database at $DB_HOST..."

# Check if we can connect
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -c "SELECT version();" > /dev/null
echo "Database connection successful!"

echo "Creating NDC Plus 2 schema..."
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -f ndc_plus2_simple_schema.sql

echo "Verifying schema creation..."
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -c "\dt" 

echo "Inserting sample data..."
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -f ndc_plus2_sample_data.sql

echo "Verifying data insertion..."
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -c "SELECT COUNT(*) as event_count FROM event;"
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -c "SELECT COUNT(*) as location_count FROM location_solution;"
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -c "SELECT COUNT(*) as detection_count FROM signal_detection_hypothesis;"

echo "NDC Plus 2 database initialization complete!"
echo "Database endpoint: $DB_HOST"
echo "Database schema includes:"
echo "  - Events and location solutions"
echo "  - Signal detections and measurements"
echo "  - Amplitude and magnitude solutions"
echo "  - Channel segments and waveforms"
echo "  - Quality control and processing masks"