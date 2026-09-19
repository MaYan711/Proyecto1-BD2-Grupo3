SELECT
    subname,
    subenabled,
    subpublications,
    suborigin
FROM pg_subscription;

SELECT
    subname,
    pid,
    received_lsn,
    latest_end_lsn,
    latest_end_time
FROM pg_stat_subscription;

SELECT
    slot_name,
    slot_type,
    active,
    confirmed_flush_lsn
FROM pg_replication_slots;

SELECT
    pubname,
    schemaname,
    tablename
FROM pg_publication_tables;
