# Evidencia Nodo 2 - Kenny

## Datos del nodo

Integrante: Kenny
Rol: Nodo 2
Sistema operativo: Ubuntu
Motor: PostgreSQL 18.6
IP Tailscale: 100.100.231.68
Hostname: kenny-salazar-HP-Laptop-14-dq1xxx
Puerto PostgreSQL: 5432

## Estado de red privada

El nodo se encuentra conectado al tailnet del grupo mediante Tailscale.

Comandos utilizados:

tailscale status
tailscale ip -4
hostname
sudo ping -c 4 100.115.156.14
tailscale ping 100.115.156.14
tailscale ping 100.89.187.125

## Estado de PostgreSQL

Cluster PostgreSQL activo:

pg_lsclusters

Resultado esperado:

18 main 5432 online postgres /var/lib/postgresql/18/main /var/log/postgresql/postgresql-18-main.log

Servicio PostgreSQL activo:

sudo systemctl status postgresql@18-main --no-pager

Resultado esperado:

Active: active (running)

## Configuracion aplicada

Archivo modificado:

/etc/postgresql/18/main/postgresql.conf

Parametros relevantes:

listen_addresses = '*'
port = 5432
wal_level = logical
max_wal_senders = 20
max_replication_slots = 20
max_logical_replication_workers = 20
max_worker_processes = 30

Archivo modificado:

/etc/postgresql/18/main/pg_hba.conf

Reglas agregadas:

host    all             all             100.64.0.0/10           scram-sha-256
host    replication     replicador      100.64.0.0/10           scram-sha-256

## Base de datos y usuarios

Base creada:

databaugs

Usuarios creados:

app_databaugs
replicador

Tabla de prueba:

prueba_replicacion

Registro inicial:

nodo2-kenny | Registro inicial creado desde Nodo 2 Kenny

## Pruebas realizadas

Prueba local:

psql -h 127.0.0.1 -U app_databaugs -d databaugs -c "SELECT current_database(), current_user, inet_server_addr(), inet_server_port();"

Resultado:

databaugs | app_databaugs | 127.0.0.1 | 5432

Prueba por Tailscale:

psql -h 100.100.231.68 -U app_databaugs -d databaugs -c "SELECT current_database(), current_user, inet_server_addr(), inet_server_port();"

Resultado:

databaugs | app_databaugs | 100.100.231.68 | 5432

Consulta de tabla:

sudo -u postgres psql -d databaugs -c "SELECT * FROM prueba_replicacion;"

Resultado:

1 | nodo2-kenny | Registro inicial creado desde Nodo 2 Kenny
