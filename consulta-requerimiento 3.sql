USE mydb;

-- Consultar estado de cita
SELECT 
    estado AS 'Estado de la Cita',
    COUNT(*) AS Cantidad
FROM Cita
GROUP BY estado
ORDER BY FIELD(estado, 'Programada', 'Atendida', 'Cancelada');