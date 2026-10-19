-- Vista de citas veterinarias
-- Cree una vista denominada vw_CitasDetalle

CREATE OR REPLACE VIEW vw_CitasDetalle AS
SELECT
    c.id_cita,
    c.fecha,
    c.hora,
    c.motivo,
    c.estado,
    m.id_mascota,
    m.nombre AS nombre_mascota,
    m.especie,
    m.raza,
    cl.id_cliente,
    CONCAT(cl.nombre, ' ', cl.apellidos) AS nombre_cliente,
    cl.telefono AS telefono_cliente,
    cl.email AS email_cliente,
    v.id_veterinario,
    CONCAT(v.nombre, ' ', v.apellidos) AS nombre_veterinario,
    v.especialidad,
    s.id_sucursal,
    s.nombre AS nombre_sucursal,
    (
        SELECT COUNT(*)
        FROM Detalle_cita dc
        WHERE dc.id_cita = c.id_cita
    ) AS cantidad_servicios
FROM
    Cita c
    INNER JOIN Mascota m ON c.id_mascota = m.id_mascota
    INNER JOIN Cliente cl ON m.id_cliente = cl.id_cliente
    INNER JOIN Veterinario v ON c.id_veterinario = v.id_veterinario
    INNER JOIN Sucursal s ON v.id_sucursal = s.id_sucursal;