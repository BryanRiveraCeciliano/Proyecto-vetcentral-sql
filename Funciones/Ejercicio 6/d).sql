-- d) Consultar el estado actual de la cita utilizando la vista vw_CitasDetalle (requerimiento 1), filtrando por 
-- el ID de la cita recién creada. 

SELECT *
FROM vw_CitasDetalle
WHERE id_cita = 5;