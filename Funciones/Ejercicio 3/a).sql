-- a) Una ejecución exitosa donde la cita y el servicio se registran correctamente. 

CALL sp_registrar_cita(
    '2026-08-20',           
    '10:30:00',             
    'Revisión post-cirugía', 
    1,                      
    2,                      
    3,                      
    'Paciente estable',     
    50000.00                
);