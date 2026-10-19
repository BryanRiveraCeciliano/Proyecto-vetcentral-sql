-- b) Verificar que el trigger trg_AuditoriaCita (requerimiento 2) registró automáticamente el evento inicial 
-- en auditoria_cita. 

SELECT * FROM auditoria_cita ORDER BY id_auditoria DESC LIMIT 1;