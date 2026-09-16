# Nodo 1

## Informacion general

- Responsable: Mario
- Sistema operativo: Windows
- PostgreSQL: 18.1
- Rol: Lectura y escritura
- IP Tailscale: 100.115.156.14
- Puerto: 5432
- Base de datos: databaugs

## Estado de configuracion

- PostgreSQL operativo
- Acceso local validado
- Acceso remoto preparado
- wal_level configurado como logical
- Usuario de replicacion creado
- Publicacion pub_nodo1 creada
- Firewall configurado para Tailscale

## Prueba local de falla

Se detuvo manualmente el servicio PostgreSQL.

Durante la falla:

- El servicio PostgreSQL se mostro como Stopped.
- El puerto 5432 dejo de escuchar.
- Las conexiones fueron rechazadas.

Posteriormente se inicio nuevamente PostgreSQL.

Despues de la recuperacion:

- PostgreSQL regreso a estado Running.
- El puerto 5432 volvio a estar disponible.
- La base databaugs pudo consultarse.
- Se verificaron 3 registros antes y despues de la prueba.
- No se observo perdida de registros.

Esta prueba valida la recuperacion local del Nodo 1. El RTO y RPO finales se mediran durante las pruebas integradas del cluster.