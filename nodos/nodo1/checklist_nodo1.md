# Checklist Nodo 1

## Infraestructura

- [x] PostgreSQL 18.1 instalado
- [x] Servicio PostgreSQL activo
- [x] Base databaugs creada
- [x] Puerto 5432 activo
- [x] Tailscale instalado
- [x] IP privada configurada
- [x] Firewall configurado

## Usuarios

- [x] Usuario bd2_admin
- [x] Usuario replicador
- [x] Permisos CRUD para bd2_admin
- [x] Permisos necesarios para replicador

## Replicacion

- [x] wal_level = logical
- [x] max_wal_senders configurado
- [x] max_replication_slots configurado
- [x] Publicacion pub_nodo1 creada
- [x] Tabla operaciones publicada
- [ ] Conexion con Nodo 2
- [ ] Suscripcion Nodo 2
- [ ] Replicacion Nodo 1 hacia Nodo 2
- [ ] Replicacion Nodo 2 hacia Nodo 1
- [ ] Replicacion hacia Nodo 3

## Pruebas

- [x] SELECT
- [x] INSERT
- [x] UPDATE
- [x] DELETE
- [x] Falla local
- [x] Recuperacion local
- [x] Persistencia local
- [ ] Failover real
- [ ] Reintegracion despues de failover
- [ ] RTO final
- [ ] RPO final

## Evidencias

- [ ] Captura configuracion PostgreSQL
- [ ] Captura Tailscale
- [ ] Captura ping Nodo 2
- [ ] Captura ping Nodo 3
- [ ] Captura publicacion
- [ ] Captura CRUD
- [ ] Captura Nodo 1 Stopped
- [ ] Captura Nodo 1 Running
- [ ] Captura persistencia post falla
- [ ] Captura replicacion real