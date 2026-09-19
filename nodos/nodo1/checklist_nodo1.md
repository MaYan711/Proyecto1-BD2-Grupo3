# Checklist Nodo 1

## Infraestructura

- [x] PostgreSQL 18.6 instalado
- [x] Servicio PostgreSQL activo
- [x] Base databaugs creada
- [x] Puerto 5432 activo
- [x] Tailscale instalado
- [x] IP privada 100.115.156.14 configurada
- [x] Firewall configurado

## Usuarios

- [x] Usuario app_databaugs
- [x] Password app_databaugs: AppBD2_2026
- [x] Usuario replicador
- [x] Password replicador: ReplicacionBD2_2026
- [x] Permisos CRUD para app_databaugs
- [x] Permisos de lectura y replicacion para replicador

## Replicacion

- [x] wal_level = logical
- [x] max_wal_senders = 20
- [x] max_replication_slots = 20
- [x] Publicacion pub_nodo1 creada
- [x] Tabla public.operaciones publicada
- [x] Conexion con Nodo 2
- [x] Conexion con Nodo 3
- [x] Suscripcion sub_nodo1_desde_nodo2
- [x] Replicacion Nodo 1 hacia Nodo 2
- [x] Replicacion Nodo 2 hacia Nodo 1
- [x] Replicacion hacia Nodo 3

## Balanceo y fallos

- [x] HAProxy disponible en 100.89.187.125:6432
- [x] Balanceo entre Nodo 1 y Nodo 2
- [x] Failover real de Nodo 1 hacia Nodo 2
- [x] Reintegracion de Nodo 1 despues de falla
- [x] Medicion de RTO ejecutada
- [ ] Registrar RPO final consolidado en informe

## Pruebas

- [x] SELECT
- [x] INSERT
- [x] UPDATE
- [x] DELETE
- [x] Falla local
- [x] Recuperacion local
- [x] Persistencia local
- [x] Failover real
- [x] Reintegracion despues de failover
- [ ] Consolidar resultados de pruebas de carga
- [ ] Consolidar monitoreo y metricas

## Evidencias

- [ ] Reemplazar captura de version por PostgreSQL 18.6
- [ ] Reemplazar captura de configuracion por max_wal_senders = 20 y max_replication_slots = 20
- [ ] Reemplazar captura pg_hba con app_databaugs
- [ ] Reemplazar captura CRUD con app_databaugs
- [x] Captura publicacion pub_nodo1
- [x] Evidencia de conexion desde Nodo 2
- [x] Evidencia de conexion desde Nodo 3
- [x] Evidencia de failover mediante HAProxy
