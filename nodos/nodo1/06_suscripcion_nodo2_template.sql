CREATE SUBSCRIPTION sub_nodo1_desde_nodo2
CONNECTION 'host=100.100.231.68 port=5432 dbname=databaugs user=replicador password=ReplicacionBD2_2026'
PUBLICATION pub_nodo2
WITH (
    copy_data = false,
    create_slot = true,
    enabled = true,
    origin = none
);
