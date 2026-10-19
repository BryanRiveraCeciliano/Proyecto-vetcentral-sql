-- e) Ejecutar EXPLAIN sobre esa consulta a la vista para verificar que los índices creados en el 
-- requerimiento 5 están siendo utilizados por el motor de MySQL. 

EXPLAIN
SELECT *
FROM vw_CitasDetalle
WHERE id_cita = 5;