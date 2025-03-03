PRINT 'Populating rutas_servicios table';

INSERT INTO transporte.rutas_servicios (nombre, importe, hora_salida, hora_llegada, dias_programados) VALUES
('Ruta Andina', 50.00, '08:00', '18:00', 'Lunes-Viernes'),
('Ruta Costera', 70.00, '09:00', '17:30', 'Todos'),
('Ruta Montañosa', 85.00, '07:30', '19:00', 'Sabado-Domingo'),
('Ruta Histórica', 60.00, '10:00', '16:00', 'Miercoles-Viernes'),
('Ruta Cultural', 45.00, '11:00', '15:00', 'Martes-Jueves'),
('Ruta Selvática', 90.00, '06:00', '20:00', 'Todos'),
('Ruta Vinícola', 75.00, '12:00', '18:30', 'Viernes-Domingo'),
('Ruta Gastronómica', 55.00, '13:00', '19:30', 'Todos'),
('Ruta Artesanal', 40.00, '14:00', '17:00', 'Martes-Sabado'),
('Ruta Religiosa', 50.00, '15:00', '20:00', 'Domingo');
