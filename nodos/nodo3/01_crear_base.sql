CREATE DATABASE databaugs;

-- Usuario de aplicacion: solo lectura (Nodo 3 es solo lectura y contingencia)
CREATE USER app_databaugs WITH PASSWORD 'LecturaBD2_2026';

GRANT CONNECT ON DATABASE databaugs TO app_databaugs;
