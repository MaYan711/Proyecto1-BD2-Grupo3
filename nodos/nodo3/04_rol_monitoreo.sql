-- Rol dedicado para postgres_exporter. Se usa pg_monitor en vez de reutilizar app_databaugs,
-- para no mezclar el usuario de aplicacion con el de observabilidad.
CREATE USER monitoreo WITH PASSWORD 'MonitoreoBD2_2026';
GRANT pg_monitor TO monitoreo;
