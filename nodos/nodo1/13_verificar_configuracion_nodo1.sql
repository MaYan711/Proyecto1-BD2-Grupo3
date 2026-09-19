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
WHERE rolname IN ('app_databaugs', 'replicador');

SELECT
    pubname,
    pubinsert,
    pubupdate,
    pubdelete,
    pubtruncate
FROM pg_publication
WHERE pubname = 'pub_nodo1';

SELECT
    pubname,
    schemaname,
    tablename
FROM pg_publication_tables
WHERE pubname = 'pub_nodo1';

SELECT
    subname,
    subenabled,
    subpublications,
    suborigin
FROM pg_subscription;

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
FROM public.operaciones;
