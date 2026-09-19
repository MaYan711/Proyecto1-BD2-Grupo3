ALTER TABLE public.operaciones
REPLICA IDENTITY DEFAULT;

CREATE PUBLICATION pub_nodo1
FOR TABLE public.operaciones
WITH (
    publish = 'insert, update, delete, truncate'
);
