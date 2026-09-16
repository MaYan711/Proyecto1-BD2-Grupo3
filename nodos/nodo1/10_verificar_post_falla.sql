SELECT CURRENT_TIMESTAMP AS momento_verificacion;

SELECT COUNT(*) AS total_registros
FROM operaciones;

SELECT
    id,
    descripcion,
    origen,
    valor,
    fecha_registro
FROM operaciones
WHERE descripcion = 'MARCA_PRE_FALLA_NODO1';

SELECT *
FROM operaciones
ORDER BY fecha_registro;