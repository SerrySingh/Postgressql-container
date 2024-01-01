# Use an official PostgreSQL base image
FROM postgres:14

# Copy custom pg_hba.conf to enable remote access
COPY pg_hba.conf /etc/postgresql/14/main/pg_hba.conf

# Copy custom postgresql.conf to set listen_address
COPY postgresql.conf /etc/postgresql/14/main/postgresql.conf

# Expose the default PostgreSQL port
EXPOSE 5432

# Environment variables for database, user, and password
ENV POSTGRES_DB=db
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

# Create a database and user, and grant privileges
COPY init.sql /docker-entrypoint-initdb.d/

# CMD ["postgres"]
