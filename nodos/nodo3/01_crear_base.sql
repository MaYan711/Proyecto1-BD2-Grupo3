CREATE DATABASE databaugs;

CREATE USER app_databaugs WITH PASSWORD 'AppBD2_2026';

GRANT CONNECT ON DATABASE databaugs TO app_databaugs;
