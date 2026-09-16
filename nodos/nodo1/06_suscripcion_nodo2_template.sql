CREATE SUBSCRIPTION sub_nodo2_en_nodo1
CONNECTION 'host=100.100.231.68 port=5432 dbname=databaugs user=replicador password=CAMBIAR_PASSWORD_REPLICACION'
PUBLICATION pub_nodo2
WITH (
    copy_data = false,
    origin = none
);