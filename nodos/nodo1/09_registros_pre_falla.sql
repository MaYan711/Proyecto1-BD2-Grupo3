SELECT
    CURRENT_TIMESTAMP AS momento_inicio,
    COUNT(*) AS registros_antes
FROM operaciones;

INSERT INTO operaciones (
    descripcion,
    origen,
    valor
)
VALUES (
    'MARCA_PRE_FALLA_NODO1',
    'NODO1',
    999.00
);

SELECT
    CURRENT_TIMESTAMP AS momento_marca,
    id,
    descripcion,
    origen,
    valor,
    fecha_registro
FROM operaciones
WHERE descripcion = 'MARCA_PRE_FALLA_NODO1';

SELECT COUNT(*) AS registros_despues_marca
FROM operaciones;