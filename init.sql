-- init.sql
-- Connect to the default "postgres" database
\c postgres

-- Check if the database "db" exists, and create it if not
DO $$ 
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'db') THEN
    CREATE DATABASE db;
  END IF;
END $$;

-- Connect to the "db" database
\c db;

-- Check if the user "postgres" exists, and create it if not
DO $$ 
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_user WHERE usename = 'postgres') THEN
    CREATE USER postgres WITH PASSWORD 'postgres';
  ELSE
    -- If the user exists, change the password
    ALTER USER postgres WITH PASSWORD 'postgres';
  END IF;
END $$;

-- Grant all privileges to the "postgres" user on the "db" database
GRANT ALL PRIVILEGES ON DATABASE db TO postgres;
