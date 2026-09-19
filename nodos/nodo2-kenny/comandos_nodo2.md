# Comandos Nodo 2 - Kenny

## Datos del nodo

Integrante: Kenny
Rol: Nodo 2
Sistema operativo: Ubuntu
Motor: PostgreSQL 18.6
IP Tailscale: 100.100.231.68
Hostname: kenny-salazar-HP-Laptop-14-dq1xxx
Puerto PostgreSQL: 5432

## Verificacion de red privada

tailscale status
tailscale ip -4
hostname
tailscale ping 100.115.156.14
tailscale ping 100.89.187.125
sudo ping -c 4 100.115.156.14
sudo ping -c 4 100.89.187.125

## Verificacion de PostgreSQL

psql --version
pg_lsclusters
sudo systemctl status postgresql@18-main --no-pager

## Archivos de configuracion modificados

/etc/postgresql/18/main/postgresql.conf
/etc/postgresql/18/main/pg_hba.conf

## Parametros agregados o verificados en postgresql.conf

listen_addresses = '*'
port = 5432
wal_level = logical
max_wal_senders = 20
max_replication_slots = 20
max_logical_replication_workers = 20
max_worker_processes = 30

## Reglas agregadas a pg_hba.conf

host    all             all             100.64.0.0/10           scram-sha-256
host    replication     replicador      100.64.0.0/10           scram-sha-256

## Reinicio del servicio

sudo systemctl restart postgresql@18-main
pg_lsclusters
sudo systemctl status postgresql@18-main --no-pager

## Estado del firewall

sudo ufw status
sudo ufw allow in on tailscale0 to any port 5432 proto tcp
sudo ufw status numbered

## Creacion y verificacion de base de datos

sudo -u postgres psql -c "\l"
sudo -u postgres psql -c "\du"
sudo -u postgres psql -d databaugs -c "SELECT * FROM prueba_replicacion;"

## Prueba local

psql -h 127.0.0.1 -U app_databaugs -d databaugs -c "SELECT current_database(), current_user, inet_server_addr(), inet_server_port();"

## Prueba por Tailscale

psql -h 100.100.231.68 -U app_databaugs -d databaugs -c "SELECT current_database(), current_user, inet_server_addr(), inet_server_port();"

## Verificacion de parametros de replicacion

sudo -u postgres psql -c "SHOW listen_addresses;"
sudo -u postgres psql -c "SHOW wal_level;"
sudo -u postgres psql -c "SHOW max_wal_senders;"
sudo -u postgres psql -c "SHOW max_replication_slots;"
