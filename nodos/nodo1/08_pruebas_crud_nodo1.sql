SELECT * FROM public.operaciones
ORDER BY fecha_registro;

INSERT INTO public.operaciones (
    descripcion,
    origen,
    valor
)
VALUES (
    'Prueba replicacion desde Nodo 1',
    'NODO1',
    500.00
);

SELECT * FROM public.operaciones
ORDER BY fecha_registro;

UPDATE public.operaciones
SET valor = 550.00
WHERE descripcion = 'Prueba replicacion desde Nodo 1';

SELECT * FROM public.operaciones
ORDER BY fecha_registro;

DELETE FROM public.operaciones
WHERE descripcion = 'Prueba replicacion desde Nodo 1';

SELECT * FROM public.operaciones
ORDER BY fecha_registro;
