#!/bin/bash
set -e

# Create roles for PostgREST
# https://postgrest.org/en/stable/tutorials/tut0.html#step-4-create-database-for-api

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	-- Create databases blue and green, and grant privileges to postgres user
    create database db_blue;
    grant all privileges on database db_blue to postgres;

    create database db_green;
    grant all privileges on database db_green to postgres;
EOSQL
