SELECT * FROM operaciones
ORDER BY fecha_registro;

INSERT INTO operaciones (
    descripcion,
    origen,
    valor
)
VALUES (
    'Prueba replicacion desde Nodo 1',
    'NODO1',
    500.00
);

SELECT * FROM operaciones
ORDER BY fecha_registro;

UPDATE operaciones
SET valor = 550.00
WHERE descripcion = 'Prueba replicacion desde Nodo 1';

SELECT * FROM operaciones
ORDER BY fecha_registro;

DELETE FROM operaciones
WHERE descripcion = 'Prueba replicacion desde Nodo 1';

SELECT * FROM operaciones
ORDER BY fecha_registro;