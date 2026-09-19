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
    relname,
    relreplident
FROM pg_class
WHERE oid = 'public.operaciones'::regclass;
