# Documentacion tecnica - Nodo 1

## Responsable

Mario

## Funcion dentro de la arquitectura

El Nodo 1 funciona como uno de los nodos principales de lectura y escritura de la arquitectura distribuida.

Permite operaciones:

- SELECT
- INSERT
- UPDATE
- DELETE

Durante condiciones normales trabaja junto con el Nodo 2.

Cuando el Nodo 1 falla, HAProxy redirige las nuevas conexiones hacia el Nodo 2.

Cuando el Nodo 1 vuelve a estar disponible, se reintegra a la arquitectura y recibe los cambios generados durante su ausencia.

## Sistema operativo

Windows 10 Pro

## Motor de base de datos

PostgreSQL 18.6

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

### app_databaugs

Usuario utilizado para operaciones normales sobre la base de datos.

Password:
AppBD2_2026

Permisos principales:

- SELECT
- INSERT
- UPDATE
- DELETE

### replicador

Usuario utilizado para conexiones relacionadas con replicacion logica.

Password:
ReplicacionBD2_2026

Configuracion:

- LOGIN
- REPLICATION
- USAGE sobre esquema public
- SELECT sobre tabla public.operaciones

## Configuracion PostgreSQL

listen_addresses = '*'

port = 5432

wal_level = logical

max_wal_senders = 20

max_replication_slots = 20

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

Estructura:

- id UUID PRIMARY KEY DEFAULT gen_random_uuid()
- descripcion TEXT NOT NULL
- origen VARCHAR(50) NOT NULL
- valor NUMERIC(10,2) NOT NULL
- fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP

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

REPLICA IDENTITY:
DEFAULT

## Suscripcion logica

Nombre:
sub_nodo1_desde_nodo2

Publisher:
Nodo 2 - 100.100.231.68

Publicacion remota:
pub_nodo2

Parametros principales:

- copy_data = false
- create_slot = true
- enabled = true
- origin = none

## Proxy y balanceador

HAProxy se encuentra en el equipo de Miguel.

Endpoint utilizado por clientes:

100.89.187.125:6432

Funcion:

- Balancear conexiones entre Nodo 1 y Nodo 2.
- Detectar fallas de los nodos principales.
- Redirigir conexiones al nodo disponible.
- Utilizar Nodo 3 como backup de contingencia para lectura.

## Pruebas realizadas

### Operaciones CRUD

Se comprobaron correctamente:

- SELECT
- INSERT
- UPDATE
- DELETE

utilizando el usuario app_databaugs.

### Conectividad privada

El Nodo 1 tiene conectividad PostgreSQL mediante Tailscale con:

- Nodo 2: 100.100.231.68
- Nodo 3: 100.89.187.125

### Replicacion

Se validaron operaciones desde Nodo 1 hacia Nodo 2 y Nodo 3.

Tambien se validaron operaciones originadas en Nodo 2 que llegaron a Nodo 1 y Nodo 3.

### Falla y failover

Se detuvo manualmente el servicio PostgreSQL del Nodo 1.

Durante la falla:

- PostgreSQL paso a estado Stopped.
- El puerto 5432 dejo de responder.
- HAProxy detecto la indisponibilidad.
- Las conexiones fueron redirigidas hacia Nodo 2.

Posteriormente se inicio nuevamente el servicio.

Resultado:

- PostgreSQL regreso a estado Running.
- Nodo 1 recupero los cambios generados durante su ausencia.
- Se comprobo reintegracion del nodo.

### Persistencia y RPO

Durante las pruebas controladas se verifico que los registros creados mientras Nodo 1 estaba fuera de servicio aparecieron despues de su recuperacion.

No se observo perdida de los registros utilizados en las pruebas realizadas.

El valor final de RPO debe registrarse junto con los resultados consolidados de todas las fases.

## Estado actual

- PostgreSQL 18.6 operativo.
- app_databaugs configurado.
- replicador configurado.
- pub_nodo1 activa.
- sub_nodo1_desde_nodo2 configurada.
- Replicacion bidireccional con Nodo 2 validada.
- Replicacion hacia Nodo 3 validada.
- HAProxy integrado.
- Failover y reintegracion probados.
- Pruebas de carga en ejecucion dentro de la Fase 6.
