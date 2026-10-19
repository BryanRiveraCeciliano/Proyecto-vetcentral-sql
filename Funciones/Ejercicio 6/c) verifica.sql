-- c) Actualizar el estado de la cita a 'Atendida'. Verificar que el trigger registró nuevamente el cambio de 
-- estado en auditoria_cita. 

SELECT *
FROM auditoria_cita
WHERE id_cita = 5
ORDER BY fecha_cambio DESC;