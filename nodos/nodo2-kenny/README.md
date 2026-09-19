# Nodo 2 - Kenny

## Datos del nodo

Integrante: Kenny  
Rol: Nodo 2  
Sistema operativo: Ubuntu  
Motor: PostgreSQL 18.6  
IP Tailscale: 100.100.231.68  
Hostname: kenny-salazar-HP-Laptop-14-dq1xxx  
Puerto PostgreSQL: 5432  

## Funcion dentro de la arquitectura

El Nodo 2 funciona como nodo principal de lectura y escritura.  
Debe permitir operaciones INSERT, UPDATE, DELETE y SELECT.  
Tambien debe participar en la replicacion con Nodo 1 y Nodo 3.

## Comandos de verificacion inicial

tailscale status
tailscale ip -4
hostname
pg_lsclusters
sudo systemctl status postgresql@18-main --no-pager
