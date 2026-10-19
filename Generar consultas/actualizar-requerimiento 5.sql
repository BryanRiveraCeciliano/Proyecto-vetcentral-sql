USE mydb;

-- Actualizar el estado
UPDATE Cita c
SET c.estado = 'Atendida'
WHERE EXISTS (
    SELECT 1 
    FROM `Detalle de atención` d 
    WHERE d.Cita_ID_Cita = c.ID_Cita 
    );