DELETE FROM operaciones
WHERE descripcion = 'MARCA_PRE_FALLA_NODO1';

DELETE FROM operaciones
WHERE descripcion LIKE 'RPO_NODO1_%';

SELECT *
FROM operaciones
ORDER BY fecha_registro;