
CREATE SUBSCRIPTION sub_nodo3_a_nodo1
CONNECTION 'host=100.115.156.14 port=5432 dbname=databaugs user=replicador password=ReplicacionBD2_2026'
PUBLICATION pub_nodo1
WITH (
    copy_data = false,
    create_slot = true,
    enabled = true,
    origin = none
);


CREATE SUBSCRIPTION sub_nodo3_a_nodo2
CONNECTION 'host=100.100.231.68 port=5432 dbname=databaugs user=replicador password=ReplicacionBD2_2026'
PUBLICATION pub_nodo2
WITH (
    copy_data = false,
    create_slot = true,
    enabled = true,
    origin = none
);

SELECT subname, subenabled, suborigin FROM pg_subscription;
