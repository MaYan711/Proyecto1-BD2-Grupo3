SELECT CURRENT_TIMESTAMP AS momento_verificacion;

SELECT COUNT(*) AS total_registros
FROM public.operaciones;

SELECT
    id,
    descripcion,
    origen,
    valor,
    fecha_registro
FROM public.operaciones
WHERE descripcion = 'MARCA_PRE_FALLA_NODO1';

SELECT *
FROM public.operaciones
ORDER BY fecha_registro;
