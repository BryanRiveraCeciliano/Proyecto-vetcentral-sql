-- b) Una ejecución fallida donde se provoca el ROLLBACK 

CALL sp_registrar_cita(
    '2026-08-21',
    '11:00:00',
    'Consulta de control',
    2,                     
    1,                   
    999,                   
    'Paciente saludable',
    15000.00
);