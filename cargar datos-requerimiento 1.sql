USE mydb;

-- Cargar los datos

-- Clientes
INSERT INTO Cliente (nombre, apellidos, teléfono, email, dirección) VALUES
('Bryan', 'Rivera', '6388-3835', 'bryanriv10@gmail.com', 'Cartago, Tejar'),
('Rachell', 'Rodriguez', '6281-2723', 'rachellrodri44z@gmail.com', 'Cartago, San Rafael'),
('Noha', 'Rivera', '8422-5674', 'noharive11@gmail.com', 'Cartago, El Carmen'),
('Lionel', 'Rivera', '6288-3596', 'lio1045@gmail.com', 'Cartago, Centro');

-- Sucursales
INSERT INTO Sucursales (nombre, dirección, teléfono, `horario de atención`) VALUES
('VetCentral S.A.', 'Cartago, Oreamuno', '2325-9898', 'Lunes-Viernes 8:00-19:00');

-- Medico veterinario
INSERT INTO `Médico Veterinario` (nombre, apellidos, especialidad, teléfono, email, Sucursales_ID_Sucursal) VALUES
('Kiara', 'Rodriguez', 'Cirugía', '8845-6779', 'kiara.cr@vetcentralsa.com', 1),
('Luz', 'Cordoba', 'Medicina general', '8732-4345', 'luz.cr@vetcentralsa.com', 1),
('Alexa', 'Mendez', 'Dermatología', '8274-8998', 'alexa.cr@vetcentralsa.com', 1);

-- Mascotas
INSERT INTO Mascotas (nombre, especie, raza, `fecha de nacimiento`, sexo, peso, Cliente_ID_Cliente) VALUES
('Violeta', 'Perro', 'Buldog', '2019-05-10', 'Hembra', 24.5, 4),
('Kiara', 'Perro', 'Pastor Aleman', '2022-08-15', 'Hembra', 29.2, 3),
('Puchini', 'Perro', 'Poodle', '2020-11-20', 'Macho', 9.5, 1),
('Bills', 'Gato', 'Persa', '2023-01-30', 'Macho', 5.8, 2);

-- Servicios
INSERT INTO Servicios (`nombre del servicio`, descripción, `precio base`, Categoría) VALUES
('Consulta general', 'Revisión completa por veterinario', 8000.00, 'Consulta'),
('Vacunación', 'Aplicación de vacuna', 3000.00, 'Prevención'),
('Cirugía menor', 'Procedimiento quirúrgico sencillo', 45000.00, 'Cirugía'),
('Desparasitación', 'Aplicación de antiparasitario', 4000.00, 'Prevención'),
('Examen de laboratorio', 'Análisis de sangre y orina', 10000.00, 'Diagnóstico');

-- Medicamentos
INSERT INTO Medicamentos (nombre, `principio activo`, presentación, `unidad de medida`, `stock disponible`) VALUES
('Amoxicilina', 'Amoxicilina trihidrato', 'Tabletas 500 mg', 'Tableta', 100),
('Meloxicam', 'Meloxicam', 'Tabletas 300 mg', 'Tableta', 150),
('Fenbendazol', 'Fenbendazol', 'Suspensión 10%', 'ml', 100),
('Dexametasona', 'Dexametasona', 'Inyectable 4 mg/ml', 'ml', 30),
('Clorhexidina', 'Clorhexidina', 'Solución 2%', 'ml', 80);

-- Citas
INSERT INTO Cita (fecha, hora, `motivo de consulta`, estado, observaciones, Mascotas_ID_Mascotas, `Médico Veterinario_ID_Veterinario`) VALUES
('2026-06-20', '09:00:00', 'Diarrea y vómitos', 'Cancelada', 'Cliente canceló por emergencia', 3, 2),
('2026-06-25', '15:30:00', 'Cirugia', 'Atendida', 'Se extrae pelota de carne maligna', 2, 1),
('2026-06-28', '11:00:00', 'Alergia en piel', 'Programada', 'Posible alergia alimentaria', 4, 3),
('2026-07-01', '14:00:00', 'Control de peso', 'Programada', 'Necesita dieta especial', 1, 2);

-- Detalle de atencion
INSERT INTO `Detalle de atención` (`observaciones específicas`, `dosis o cantidad`, `costo final aplicado`, Cita_ID_Cita, Servicios_ID_Servicio) VALUES
('Se realizó cirugia y se extrae pelota de carne maligna', '6 dosis', 70000.00, 2, 3);

-- Receta
INSERT INTO Receta (`fecha de emisión`, `indicaciones generales`, Cita_ID_Cita) VALUES
('2026-06-25 17:30:00', 'Tomar cada 12 horas por 3 días', 2);

-- Receta Medicamentos
INSERT INTO Receta_Medicamentos (dosis, `frecuencia de administración`, Medicamentos_ID_Medicamento, Receta_ID_Receta) VALUES
('1 tableta', 'Cada 12 horas', 2, 1);