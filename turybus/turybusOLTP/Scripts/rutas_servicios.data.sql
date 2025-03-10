PRINT 'Populating rutas_servicios table';

INSERT INTO transporte.rutas_servicios (id_asignacion, nombre, importe, hora_salida, hora_llegada, dias_programados) VALUES
(1, 'Ruta Andina', 50.00, '08:00', '18:00', 'Lunes-Viernes'),
(2, 'Ruta Costera', 70.00, '09:00', '17:30', 'Todos'),
(3, 'Ruta Montañosa', 85.00, '07:30', '19:00', 'Sabado-Domingo'),
(4, 'Ruta Histórica', 60.00, '10:00', '16:00', 'Miercoles-Viernes'),
(5, 'Ruta Cultural', 45.00, '11:00', '15:00', 'Martes-Jueves'),
(6, 'Ruta Selvática', 90.00, '06:00', '20:00', 'Todos'),
(7,'Ruta Vinícola', 75.00, '12:00', '18:30', 'Viernes-Domingo'),
(8,'Ruta Gastronómica', 55.00, '13:00', '19:30', 'Todos'),
(9, 'Ruta Artesanal', 40.00, '14:00', '17:00', 'Martes-Sabado'),
(10, 'Ruta Religiosa', 50.00, '15:00', '20:00', 'Domingo');
