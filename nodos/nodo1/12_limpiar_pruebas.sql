DELETE FROM public.operaciones
WHERE descripcion = 'MARCA_PRE_FALLA_NODO1';

DELETE FROM public.operaciones
WHERE descripcion LIKE 'RPO_NODO1_%';

SELECT *
FROM public.operaciones
ORDER BY fecha_registro;
