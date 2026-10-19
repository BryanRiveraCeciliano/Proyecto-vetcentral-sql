-- registrar la nueva cita

CALL sp_registrar_cita(
    '2026-08-16',        
    '15:30:00',          
    'Vómitos frecuentes y decaimiento', 
    1,                     
    1,                     
    1,                    
    'Paciente con vómitos y letargo',  
    8000.00               
);