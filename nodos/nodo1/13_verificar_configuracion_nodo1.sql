SELECT version();

SELECT current_database();

SHOW listen_addresses;
SHOW port;
SHOW wal_level;
SHOW max_wal_senders;
SHOW max_replication_slots;
SHOW hot_standby;

SELECT
    rolname,
    rolcanlogin,
    rolreplication
FROM pg_roles
WHERE rolname IN ('bd2_admin', 'replicador');

SELECT
    pubname,
    puballtables
FROM pg_publication;

SELECT
    pubname,
    schemaname,
    tablename
FROM pg_publication_tables;

SELECT
    line_number,
    database,
    user_name,
    address,
    auth_method,
    error
FROM pg_hba_file_rules
WHERE address IN (
    '100.100.231.68',
    '100.89.187.125'
);

SELECT COUNT(*) AS total_operaciones
FROM operaciones;