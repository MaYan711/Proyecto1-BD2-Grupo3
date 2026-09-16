# Bitacora tecnica - Nodo 1

Responsable: Mario
Sistema operativo: Windows
PostgreSQL: 18.1
Rol: Lectura y escritura
IP Tailscale: 100.115.156.14
Puerto PostgreSQL: 5432
Base de datos: databaugs

## Registro de pruebas

| Fecha y hora | Fase | Nodo / componente | Accion realizada | Resultado esperado | Resultado obtenido | Tiempo de recuperacion | Evidencia | Observaciones |
|---|---|---|---|---|---|---|---|---|
| 2026-09-14 | Fase 1 | Nodo 1 | Instalacion y verificacion de PostgreSQL | PostgreSQL disponible | PostgreSQL 18.1 ejecutandose correctamente | N/A | Pendiente captura | Servicio postgresql-x64-18 en estado Running |
| 2026-09-14 | Fase 1 | Nodo 1 | Configuracion de red privada mediante Tailscale | Comunicacion con Nodo 2 y Nodo 3 | Ping exitoso hacia ambos equipos | N/A | Pendiente captura | IP Nodo 1: 100.115.156.14 |
| 2026-09-14 | Fase 1 | Nodo 1 | Configuracion de PostgreSQL para conexiones externas | Puerto 5432 disponible | PostgreSQL escuchando en IPv4 e IPv6 | N/A | Pendiente captura | listen_addresses = * |
| 2026-09-14 | Fase 1 | Nodo 1 | Configuracion de replicacion logica | Nodo preparado como publisher | wal_level = logical y pub_nodo1 creada | N/A | Pendiente captura | Tabla public.operaciones publicada |
| 2026-09-16 | Preparacion Fase 3 | Nodo 1 | Detencion manual de PostgreSQL | Nodo 1 no disponible | Servicio Stopped, puerto 5432 cerrado y conexion rechazada | N/A | Pendiente captura | Falla controlada correcta |
| 2026-09-16 | Preparacion Fase 3 | Nodo 1 | Recuperacion manual de PostgreSQL | Nodo 1 vuelve a estar disponible | Servicio Running, puerto 5432 disponible y databaugs accesible | Pendiente medicion definitiva | Pendiente captura | Los 3 registros permanecieron almacenados |