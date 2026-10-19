USE mydb;

-- Consultar servicios prestados
SELECT 
    c.ID_Cita AS 'ID Cita',
    c.fecha AS 'Fecha Cita',
    m.nombre AS 'Mascota',
    s.`nombre del servicio` AS 'Servicio',
    d.`observaciones específicas` AS 'Observaciones',
    d.`costo final aplicado` AS 'Costo Final'
FROM `Detalle de atención` d
INNER JOIN Cita c ON d.Cita_ID_Cita = c.ID_Cita
INNER JOIN Mascotas m ON c.Mascotas_ID_Mascotas = m.ID_Mascotas
INNER JOIN Servicios s ON d.Servicios_ID_Servicio = s.ID_Servicio
ORDER BY c.fecha DESC;