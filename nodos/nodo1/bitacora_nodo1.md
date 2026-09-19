# Bitacora tecnica - Nodo 1

Responsable: Mario
Sistema operativo: Windows 10 Pro
PostgreSQL: 18.6
Rol: Lectura y escritura
IP Tailscale: 100.115.156.14
Puerto PostgreSQL: 5432
Base de datos: databaugs
Usuario aplicacion: app_databaugs
Password aplicacion: AppBD2_2026
Usuario replicacion: replicador
Password replicacion: ReplicacionBD2_2026

## Registro de pruebas

| Fecha y hora | Fase | Nodo / componente | Accion realizada | Resultado esperado | Resultado obtenido | Tiempo de recuperacion | Evidencia | Observaciones |
|---|---|---|---|---|---|---|---|---|
| 2026-09-14 | Fase 1 | Nodo 1 | Instalacion y verificacion de PostgreSQL | PostgreSQL disponible | PostgreSQL instalado y operativo | N/A | Captura version | Posteriormente actualizado a PostgreSQL 18.6 |
| 2026-09-18 | Fase 1 | Nodo 1 | Actualizacion de PostgreSQL | Mantener servicio y base de datos | PostgreSQL 18.6 operativo y databaugs conservada | N/A | Captura version actualizada | Servicio postgresql-x64-18 |
| 2026-09-18 | Fase 1 | Nodo 1 | Estandarizacion de public.operaciones | Igualar esquema con Nodo 2 | descripcion TEXT, origen VARCHAR(50), valor NUMERIC(10,2) | N/A | Captura estructura | Esquema compatible entre nodos |
| 2026-09-18 | Fase 1 | Nodo 1 | Configuracion de usuario de aplicacion | app_databaugs con acceso CRUD | Conexion local y remota validada | N/A | Captura conexion | Password local: AppBD2_2026 |
| 2026-09-18 | Fase 1 | Nodo 1 | Configuracion de replicacion logica | Nodo preparado como publisher y subscriber | pub_nodo1 y sub_nodo1_desde_nodo2 activos | N/A | Capturas replicacion | origin = none |
| 2026-09-18 | Fase 2 | Nodo 1 | Pruebas CRUD replicadas | Cambios visibles en Nodo 2 y Nodo 3 | INSERT, UPDATE y DELETE replicados | N/A | Capturas Fase 2 | Pruebas controladas |
| 2026-09-18 | Fase 3 | Nodo 1 | Falla controlada de PostgreSQL | Nodo 1 no disponible y failover a Nodo 2 | HAProxy redirigio conexiones al Nodo 2 | Medido durante prueba | Capturas Fase 3 | Nodo 1 se reintegro posteriormente |
| 2026-09-18 | Fase 3 | Nodo 1 | Recuperacion y reintegracion | Recuperar cambios generados durante la falla | Registro creado en Nodo 2 aparecio en Nodo 1 | Medido durante prueba | Capturas Fase 3 | Sin perdida observada en la prueba |
