-- b) Una consulta que filtre las citas de una sucursal específica, ordenadas por fecha descendente.  

SELECT *
FROM vw_CitasDetalle
WHERE id_sucursal = 1
ORDER BY fecha DESC, hora DESC;