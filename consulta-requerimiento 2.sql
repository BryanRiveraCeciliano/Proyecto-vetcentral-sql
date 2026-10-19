USE mydb;

-- Realizar consulta
SELECT 
    c.ID_Cita AS 'ID Cita',
    c.fecha AS 'Fecha',
    c.hora AS 'Hora',
    c.`motivo de consulta` AS 'Motivo Consulta',
    c.estado AS 'Estado',
    m.ID_Mascotas AS 'ID Mascota',
    m.nombre AS 'Nombre Mascota',
    m.especie AS 'Especie',
    cl.ID_Cliente AS 'ID Cliente',
    CONCAT(cl.nombre, ' ', cl.apellidos) AS 'Nombre Cliente',
    v.ID_Veterinario AS 'ID Veterinario',
    CONCAT(v.nombre, ' ', v.apellidos) AS 'Nombre Veterinario',
    v.especialidad AS 'Especialidad',
    s.ID_Sucursal AS 'ID Sucursal',
    s.nombre AS 'Nombre Sucursal'
FROM Cita c
INNER JOIN Mascotas m ON c.Mascotas_ID_Mascotas = m.ID_Mascotas
INNER JOIN Cliente cl ON m.Cliente_ID_Cliente = cl.ID_Cliente
INNER JOIN `Médico Veterinario` v ON c.`Médico Veterinario_ID_Veterinario` = v.ID_Veterinario
INNER JOIN Sucursales s ON v.Sucursales_ID_Sucursal = s.ID_Sucursal
ORDER BY c.fecha DESC;