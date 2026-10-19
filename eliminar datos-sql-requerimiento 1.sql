USE mydb;

-- Desactivar el cheqieo de foraneas
SET FOREIGN_KEY_CHECKS = 0;

-- Se trunca el orden inverso a las dependencias
TRUNCATE TABLE Receta_Medicamentos;
TRUNCATE TABLE Receta;
TRUNCATE TABLE `Detalle de atención`;
TRUNCATE TABLE Cita;
TRUNCATE TABLE Medicamentos;
TRUNCATE TABLE Servicios;
TRUNCATE TABLE `Médico Veterinario`;
TRUNCATE TABLE Sucursales;
TRUNCATE TABLE Mascotas;
TRUNCATE TABLE Cliente;

-- Reactivar el chequeo de foraneas
SET FOREIGN_KEY_CHECKS = 1;

