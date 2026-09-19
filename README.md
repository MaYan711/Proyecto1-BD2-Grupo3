# Proyecto 1 - BD2 - Grupo 3

Arquitectura distribuida de PostgreSQL con replicacion logica, proxy/balanceador,
monitoreo y pruebas de carga, para el proyecto de Bases de Datos 2. Motor
asignado: **PostgreSQL** (grupo impar).

## Equipo y roles

| Nodo | Responsable | Rol | IP Tailscale |
|------|-------------|-----|--------------|
| Nodo 1 | Mario | Lectura y escritura | `100.115.156.14` |
| Nodo 2 | Kenny | Lectura y escritura | `100.100.231.68` |
| Nodo 3 | Miguel | Solo lectura y contingencia | `100.89.187.125` |
| Proxy/balanceador | Miguel | HAProxy, en la misma maquina de Nodo 3 | `100.89.187.125:6432` |
| Monitoreo | Miguel | Prometheus + Grafana, centralizado en Nodo 3 | `100.89.187.125:3000` |
Replicacion: logica (`pg_publication`/`pg_subscription`), mesh bidireccional
entre Nodo 1 y Nodo 2, con Nodo 3 suscrito a ambos como destino de solo
lectura. Red privada: Tailscale entre las tres maquinas.

## Estructura del repositorio

```
nodos/
  nodo1/          Config y scripts de Mario (Windows)
  nodo2-kenny/    Config y scripts de Kenny (Ubuntu)
  nodo3/          Config y scripts de Miguel (Ubuntu)
proxy/
  haproxy.cfg     Balanceador: round robin Nodo1/Nodo2, Nodo3 como backup
monitoreo/
  docker-compose.yml   Prometheus + Grafana + 3x postgres_exporter
  prometheus.yml       Config de scraping
carga/
  prueba_carga.js Script de k6 (INSERT/SELECT contra `operaciones`)
```

Cada carpeta de nodo/componente tiene su propio `README.md` con el detalle
tecnico (usuarios, passwords, comandos exactos). Este README es solo el mapa
general.

## Base de datos y tabla

- Base de datos: `databaugs`
- Tabla replicada: `public.operaciones` (`id UUID`, `descripcion`, `origen`,
  `valor`, `fecha_registro`)
- Usuario de aplicacion en los tres nodos: `app_databaugs` / `AppBD2_2026`
  (lectura/escritura en Nodo 1 y Nodo 2; solo `SELECT` en Nodo 3)
- Usuario de replicacion: `replicador` / `ReplicacionBD2_2026`
- Usuario de monitoreo (`pg_monitor`, sin privilegios de escritura):
  `monitor` (Nodo 1 y Nodo 2) / `monitoreo` (Nodo 3) - password
  `MonitorBD2_2026` en los tres

## Orden para levantar el ambiente desde cero

1. **Cada nodo instala PostgreSQL** y aplica su propio esquema
   (`01_crear_base.sql`, `02_esquema.sql` en cada carpeta `nodos/nodoX`).
2. **Conectar los tres equipos por Tailscale** y validar conectividad
   (`tailscale ping`) antes de tocar PostgreSQL.
3. **Nodo 1 y Nodo 2 crean su publicacion** (`pub_nodo1`, `pub_nodo2`) y se
   suscriben mutuamente - ver `nodos/nodo1/04_publicacion.sql` y
   equivalente en Nodo 2.
4. **Nodo 3 se suscribe a ambos** - `nodos/nodo3/03_suscripcion.sql`.
5. **Levantar el proxy** (`proxy/haproxy.cfg`) en la maquina de Nodo 3 -
   ver `proxy/README.md`.
6. **Levantar el monitoreo** (`monitoreo/docker-compose.yml`) - ver
   `monitoreo/README.md`.
7. **Correr las pruebas de carga** con k6 

## Acceso rapido

- Proxy (lectura/escritura, round robin Nodo1/Nodo2, Nodo3 de backup):
  `100.89.187.125:6432`
- Panel de estadisticas de HAProxy: `http://100.89.187.125:8404/stats`
- Grafana: `http://100.89.187.125:3000` (usuario `admin`)
- Prometheus: `http://100.89.187.125:9090`
