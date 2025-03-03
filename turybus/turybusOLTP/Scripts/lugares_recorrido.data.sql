PRINT 'Populating lugares_recorrido table';
SET NOCOUNT ON;

SET IDENTITY_INSERT transporte.lugares_recorrido ON;

INSERT INTO transporte.lugares_recorrido (id_ruta_servicio, nombre, hora_llegada, actividad, tiempo_parada) VALUES
(1, 'Parada 1', '06:30', 'Descanso', 10),
(2, 'Parada 2', '08:00', 'Cambio de conductor', 15),
(3, 'Parada 3', '09:30', 'Repostaje', 20),
(4, 'Parada 4', '10:45', 'Revisión técnica', 30),
(5, 'Parada 5', '12:15', 'Descanso', 10),
(6, 'Parada 6', '13:45', 'Inspección', 15),
(7, 'Parada 7', '15:30', 'Carga de pasajeros', 25),
(8, 'Parada 8', '17:00', 'Limpieza', 20),
(9, 'Parada 9', '18:30', 'Revisión técnica', 30),
(10, 'Parada 10', '20:00', 'Finalización', 0);

SET IDENTITY_INSERT transporte.lugares_recorrido OFF;