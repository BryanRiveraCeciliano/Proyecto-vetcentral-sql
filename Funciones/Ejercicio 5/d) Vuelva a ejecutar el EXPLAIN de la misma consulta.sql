-- d) Vuelva a ejecutar el EXPLAIN de la misma consulta 

EXPLAIN
SELECT *
FROM Cita
WHERE fecha >= '2026-01-01'
AND fecha < '2026-07-01';