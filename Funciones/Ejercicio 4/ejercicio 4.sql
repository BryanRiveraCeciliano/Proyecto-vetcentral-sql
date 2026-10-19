-- 1. Usuario admin

CREATE USER IF NOT EXISTS 'admin_vetcentral'@'localhost'
IDENTIFIED BY 'Proyecto2026*';

GRANT ALL PRIVILEGES ON VetCentral.*
TO 'admin_vetcentral'@'localhost';

-- 2. Usuario veterinario 

CREATE USER IF NOT EXISTS 'veterinario_ro'@'localhost'
IDENTIFIED BY 'Proyecto2026*';

GRANT SELECT ON VetCentral.Cita TO 'veterinario_ro'@'localhost';
GRANT SELECT ON VetCentral.Detalle_cita TO 'veterinario_ro'@'localhost';
GRANT SELECT ON VetCentral.Mascota TO 'veterinario_ro'@'localhost';
GRANT SELECT ON VetCentral.Receta TO 'veterinario_ro'@'localhost';

-- 3. Usuario de app

CREATE USER IF NOT EXISTS 'app_vetcentral'@'localhost'
IDENTIFIED BY 'Proyecto2026*';

-- Permisos sobre Cita
GRANT SELECT, INSERT, UPDATE ON VetCentral.Cita TO 'app_vetcentral'@'localhost';

-- Permisos sobre Detalle_cita
GRANT SELECT, INSERT, UPDATE ON VetCentral.Detalle_cita TO 'app_vetcentral'@'localhost';

-- Permisos sobre Receta
GRANT SELECT, INSERT, UPDATE ON VetCentral.Receta TO 'app_vetcentral'@'localhost';

-- Permisos sobre Receta_medicamento
GRANT SELECT, INSERT, UPDATE ON VetCentral.Receta_medicamento TO 'app_vetcentral'@'localhost';

FLUSH PRIVILEGES;