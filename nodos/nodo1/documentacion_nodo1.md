# Documentacion tecnica - Nodo 1

## Responsable

Mario

## Funcion dentro de la arquitectura

El Nodo 1 funciona como uno de los nodos principales de lectura y escritura de la arquitectura distribuida.

Debe permitir operaciones:

- SELECT
- INSERT
- UPDATE
- DELETE

Durante condiciones normales trabajara junto con el Nodo 2.

Cuando el Nodo 1 falle, el Nodo 2 debera continuar ofreciendo operaciones de lectura y escritura.

Cuando el Nodo 1 vuelva a estar disponible, debera reintegrarse a la arquitectura y sincronizar los cambios correspondientes.

## Sistema operativo

Windows

## Motor de base de datos

PostgreSQL 18.1

## Hostname

DESKTOP-06J573U

## Red privada

Tailscale

IP Nodo 1:

100.115.156.14

IP Nodo 2:

100.100.231.68

IP Nodo 3:

100.89.187.125

## Puerto PostgreSQL

5432

## Base de datos

databaugs

## Rol del nodo

Lectura y escritura

## Usuarios

### bd2_admin

Usuario utilizado para operaciones normales sobre la base de datos.

Permisos principales:

- SELECT
- INSERT
- UPDATE
- DELETE

### replicador

Usuario utilizado para conexiones relacionadas con replicacion logica.

Configuracion:

- LOGIN
- REPLICATION
- USAGE sobre esquema public
- SELECT sobre tabla operaciones

## Configuracion PostgreSQL

listen_addresses = '*'

port = 5432

wal_level = logical

max_wal_senders = 10

max_replication_slots = 10

hot_standby = on

## Configuracion de red

PostgreSQL acepta conexiones desde las IP privadas Tailscale correspondientes al Nodo 2 y Nodo 3.

Las conexiones utilizan autenticacion:

scram-sha-256

## Firewall

Windows Firewall permite conexiones TCP entrantes al puerto 5432 desde la red Tailscale.

Red permitida:

100.64.0.0/10

## Dataset

La tabla principal utilizada para pruebas es:

public.operaciones

Los identificadores utilizan UUID para disminuir conflictos entre escrituras generadas desde diferentes nodos.

## Publicacion logica

Nombre:

pub_nodo1

Tabla publicada:

public.operaciones

Operaciones publicadas:

- INSERT
- UPDATE
- DELETE
- TRUNCATE

## Pruebas realizadas

### Operaciones CRUD

Se comprobaron correctamente:

- SELECT
- INSERT
- UPDATE
- DELETE

utilizando el usuario bd2_admin.

### Conectividad privada

El Nodo 1 tiene conectividad Tailscale hacia:

- Nodo 2: 100.100.231.68
- Nodo 3: 100.89.187.125

### Falla local

Se detuvo manualmente el servicio PostgreSQL.

Durante la falla:

- PostgreSQL paso a estado Stopped.
- El puerto 5432 dejo de escuchar.
- Las conexiones fueron rechazadas.

Posteriormente se inicio nuevamente el servicio.

Resultado:

- PostgreSQL regreso a estado Running.
- El puerto 5432 volvio a estar disponible.
- databaugs pudo consultarse nuevamente.

### Persistencia

Antes de una falla controlada se inserto:

MARCA_PRE_FALLA_NODO1

Despues de recuperar PostgreSQL:

- La marca continuo disponible.
- Se conservaron los registros existentes.
- No se observo perdida local de registros.

Esta prueba no representa todavia el RPO final de la arquitectura.

## Pendientes de integracion

- Conexion PostgreSQL real desde Nodo 2.
- Conexion PostgreSQL real desde Nodo 3.
- Suscripcion del Nodo 2 a pub_nodo1.
- Suscripcion del Nodo 1 a pub_nodo2.
- Verificacion de replicacion Nodo 1 hacia Nodo 2.
- Verificacion de replicacion Nodo 2 hacia Nodo 1.
- Verificacion de replicacion hacia Nodo 3.
- Prueba de failover mediante proxy.
- Reintegracion del Nodo 1.
- Medicion final de RTO.
- Medicion final de RPO.