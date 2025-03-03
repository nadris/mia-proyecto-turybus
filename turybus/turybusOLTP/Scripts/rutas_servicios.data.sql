PRINT 'Populating rutas_servicios table';
SET NOCOUNT ON;

SET IDENTITY_INSERT transporte.rutas_servicios ON;  

INSERT INTO transporte.rutas_servicios (nombre, importe, hora_salida, hora_llegada, dias_programados) VALUES
('Ruta 1', 10.50, '06:00', '08:00', 'Lunes a Viernes'),
('Ruta 2', 15.75, '07:30', '09:45', 'Todos los días'),
('Ruta 3', 12.00, '09:00', '11:00', 'Lunes a Sábado'),
('Ruta 4', 8.25, '10:30', '12:15', 'Domingo'),
('Ruta 5', 18.90, '12:00', '14:30', 'Lunes a Viernes'),
('Ruta 6', 9.50, '14:00', '16:00', 'Martes y Jueves'),
('Ruta 7', 20.00, '16:30', '18:45', 'Todos los días'),
('Ruta 8', 11.25, '18:00', '20:15', 'Lunes a Miércoles'),
('Ruta 9', 14.60, '19:30', '21:45', 'Viernes y Sábado'),
('Ruta 10', 7.80, '21:00', '23:00', 'Domingo');

SET IDENTITY_INSERT transporte.rutas_servicios OFF;