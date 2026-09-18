-- El esquema debe ser IDENTICO al de Nodo 1 / Nodo 2: la replicacion logica
-- no crea tablas, solo replica filas hacia tablas que ya existen en el subscriber.
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE operaciones (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    descripcion VARCHAR(150) NOT NULL,
    origen VARCHAR(20) NOT NULL,
    valor NUMERIC(10,2) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

GRANT USAGE ON SCHEMA public TO app_databaugs;

-- Solo lectura: a diferencia de Nodo 1 y Nodo 2, app_databaugs aqui NO
-- recibe INSERT/UPDATE/DELETE. Las filas llegan solo via replicacion.
GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_databaugs;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT ON TABLES TO app_databaugs;
