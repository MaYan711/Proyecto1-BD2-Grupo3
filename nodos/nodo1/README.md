# Nodo 1

## Informacion general

- Responsable: Mario
- Sistema operativo: Windows 10 Pro
- PostgreSQL: 18.6
- Rol: Lectura y escritura
- IP Tailscale: 100.115.156.14
- Puerto PostgreSQL: 5432
- Base de datos: databaugs
- Usuario de aplicacion: app_databaugs
- Password aplicacion: AppBD2_2026
- Usuario de replicacion: replicador
- Password replicacion: ReplicacionBD2_2026

## Estado de configuracion

- PostgreSQL 18.6 operativo
- Acceso local validado
- Acceso remoto desde Nodo 2 y Nodo 3 validado
- wal_level = logical
- max_wal_senders = 20
- max_replication_slots = 20
- Usuario app_databaugs configurado
- Usuario replicador configurado
- Publicacion pub_nodo1 creada
- Suscripcion sub_nodo1_desde_nodo2 creada
- Replicacion logica bidireccional Nodo 1 <-> Nodo 2 validada
- Replicacion hacia Nodo 3 validada
- Firewall configurado para Tailscale
- HAProxy disponible en 100.89.187.125:6432

## Pruebas realizadas

Se realizaron pruebas de:

- SELECT, INSERT, UPDATE y DELETE
- Replicacion Nodo 1 hacia Nodo 2 y Nodo 3
- Replicacion Nodo 2 hacia Nodo 1 y Nodo 3
- Falla controlada de Nodo 1
- Recuperacion y reintegracion de Nodo 1
- Failover mediante HAProxy
- Medicion de RTO
- Verificacion de persistencia y sincronizacion posterior a fallas

## Nota

Los valores de RTO y RPO definitivos deben registrarse con los resultados obtenidos durante las pruebas integradas del cluster.
