-- c) Actualizar el estado de la cita a 'Atendida'. Verificar que el trigger registró nuevamente el cambio de 
-- estado en auditoria_cita. 

UPDATE Cita
SET estado = 'Atendida'
WHERE id_cita = 5;