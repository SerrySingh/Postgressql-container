-- init.sql

-- Create a database
CREATE DATABASE db;

-- Create a user
CREATE USER postgres WITH PASSWORD 'postgres';

-- Grant all privileges on the database to the user
GRANT ALL PRIVILEGES ON DATABASE db TO postgres;

-- Change the password for the user
ALTER USER postgres WITH PASSWORD 'new_password';
