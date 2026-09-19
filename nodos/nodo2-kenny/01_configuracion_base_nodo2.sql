DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'app_databaugs') THEN
        CREATE ROLE app_databaugs LOGIN PASSWORD 'AppBD2_2026';
    ELSE
        ALTER ROLE app_databaugs WITH LOGIN PASSWORD 'AppBD2_2026';
    END IF;

    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'replicador') THEN
        CREATE ROLE replicador WITH REPLICATION LOGIN PASSWORD 'ReplicacionBD2_2026';
    ELSE
        ALTER ROLE replicador WITH REPLICATION LOGIN PASSWORD 'ReplicacionBD2_2026';
    END IF;
END
$$;

GRANT ALL PRIVILEGES ON DATABASE databaugs TO app_databaugs;
GRANT CONNECT ON DATABASE databaugs TO replicador;

\c databaugs

GRANT USAGE, CREATE ON SCHEMA public TO app_databaugs;
GRANT USAGE ON SCHEMA public TO replicador;

CREATE TABLE IF NOT EXISTS prueba_replicacion (
    id BIGSERIAL PRIMARY KEY,
    nodo_origen VARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO app_databaugs;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO app_databaugs;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO replicador;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO replicador;
