# Actualizaciones Nodo 1 - PostgreSQL 18.6

Se actualizaron los archivos del Nodo 1 para reflejar la configuracion final utilizada durante el proyecto.

## Cambios principales

- PostgreSQL actualizado de 18.1 a 18.6.
- Usuario de aplicacion cambiado de bd2_admin a app_databaugs.
- Password app_databaugs: AppBD2_2026.
- Password replicador: ReplicacionBD2_2026.
- Tabla public.operaciones estandarizada.
- descripcion = TEXT.
- origen = VARCHAR(50).
- valor = NUMERIC(10,2).
- max_wal_senders = 20.
- max_replication_slots = 20.
- Publicacion final: pub_nodo1.
- Suscripcion final: sub_nodo1_desde_nodo2.
- origin = none.
- HAProxy: 100.89.187.125:6432.
- Se agrego medir_rto_failover.ps1.

## Evidencias pendientes de reemplazo manual

Las imagenes existentes dentro de evidencias/fase1/mario no se modificaron porque son capturas reales.

Se recomienda reemplazar:

- 01_postgresql_version.png
- 03_tailscale_mario.png
- 04_ping_kenny.png
- 05_ping_miguel.png
- 06_configuracion_postgresql.png
- 07_pg_hba_nodos.png
- 09_crud_bd2_admin.png

Las nuevas capturas deben mostrar la configuracion final con PostgreSQL 18.6 y app_databaugs.
