
DROP PROCEDURE IF EXISTS sp_registrar_cita;

-- Crea el procedimiento almacenado transaccional

DELIMITER //

CREATE PROCEDURE sp_registrar_cita(
    -- Datos de la cita
    IN p_fecha DATE,
    IN p_hora TIME,
    IN p_motivo VARCHAR(300),
    IN p_id_mascota INT,
    IN p_id_veterinario INT,
    -- Datos del detalle
    IN p_id_servicio INT,
    IN p_observaciones TEXT,
    IN p_costo_final DECIMAL(10,2)
)
BEGIN
    -- Variables locales
    DECLARE v_id_cita INT;
    DECLARE v_existe_mascota INT DEFAULT 0;
    DECLARE v_existe_veterinario INT DEFAULT 0;
    DECLARE v_existe_servicio INT DEFAULT 0;

    -- Declara manejador de errores para capturar cualquier excepción
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Deshacer cualquier cambio pendiente
        ROLLBACK;
        -- Emitir mensaje de error genérico
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al registrar la cita. Se ha realizado ROLLBACK.';
    END;

    -- Valida que la mascota existe
    SELECT COUNT(*) INTO v_existe_mascota
    FROM Mascota
    WHERE id_mascota = p_id_mascota;

    IF v_existe_mascota = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error, la mascota especificada no existe.';
    END IF;

    -- Valida que el veterinario existe
    SELECT COUNT(*) INTO v_existe_veterinario
    FROM Veterinario
    WHERE id_veterinario = p_id_veterinario;

    IF v_existe_veterinario = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error, el veterinario especificado no existe.';
    END IF;

    -- Valida que el servicio existe
    SELECT COUNT(*) INTO v_existe_servicio
    FROM Servicio
    WHERE id_servicio = p_id_servicio;

    IF v_existe_servicio = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error, el servicio especificado no existe. Operación cancelada.';
    END IF;

    START TRANSACTION;

	-- Inserta la cita
    INSERT INTO Cita (
        fecha,
        hora,
        motivo,
        estado,
        observaciones,
        id_mascota,
        id_veterinario
    ) VALUES (
        p_fecha,
        p_hora,
        p_motivo,
        'Programada',             
        p_observaciones,
        p_id_mascota,
        p_id_veterinario
    );

    SET v_id_cita = LAST_INSERT_ID();

    INSERT INTO Detalle_cita (
        observaciones,
        dosis_cantidad,
        costo_final,
        id_cita,
        id_servicio
    ) VALUES (
        NULL,                      
        NULL,                      
        p_costo_final,
        v_id_cita,
        p_id_servicio
    );

    COMMIT;

    -- Mensaje éxito 
    SELECT CONCAT('Cita registrada exitosamente con ID: ', v_id_cita) AS mensaje;

END //

DELIMITER ;