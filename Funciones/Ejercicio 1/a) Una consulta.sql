-- a) Una consulta que filtre únicamente las citas con estado 'Programada'. 

SELECT *
FROM vw_CitasDetalle
WHERE estado = 'Programada';