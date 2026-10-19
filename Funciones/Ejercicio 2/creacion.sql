-- 1. Crear la tabla de auditoría 

CREATE TABLE IF NOT EXISTS auditoria_cita (
    id_auditoria INT NOT NULL AUTO_INCREMENT,
    id_cita INT NOT NULL,
    fecha_cambio DATETIME NOT NULL,
    estado_anterior VARCHAR(20) NOT NULL,
    estado_nuevo VARCHAR(20) NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    usuario_bd VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB;

-- 2. Crear el trigger AFTER UPDATE sobre Cita

DELIMITER //

CREATE TRIGGER trg_AuditoriaCita
AFTER UPDATE ON Cita
FOR EACH ROW
BEGIN
    IF OLD.estado != NEW.estado THEN
        INSERT INTO auditoria_cita (
            id_cita,
            fecha_cambio,
            estado_anterior,
            estado_nuevo,
            descripcion,
            usuario_bd
        ) VALUES (
            NEW.id_cita,
            NOW(),
            OLD.estado,
            NEW.estado,
            CONCAT('Estado cambiado de ', OLD.estado, ' a ', NEW.estado),
            USER()
        );
    END IF;
END //

DELIMITER ;