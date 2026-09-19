INSERT INTO public.operaciones (
    descripcion,
    origen,
    valor
)
SELECT
    'RPO_NODO1_' || numero,
    'NODO1',
    numero * 10.00
FROM generate_series(1, 20) AS numero;

SELECT
    COUNT(*) AS registros_rpo_generados
FROM public.operaciones
WHERE descripcion LIKE 'RPO_NODO1_%';

SELECT
    id,
    descripcion,
    origen,
    valor,
    fecha_registro
FROM public.operaciones
WHERE descripcion LIKE 'RPO_NODO1_%'
ORDER BY fecha_registro;
