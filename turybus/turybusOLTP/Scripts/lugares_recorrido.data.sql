PRINT 'Populating lugares_recorrido table';

INSERT INTO transporte.lugares_recorrido (id_ruta_servicio, nombre, hora_llegada, actividad, tiempo_parada) VALUES
(1, 'Mirador Andino', '10:00', 'Fotografía', 30),
(2, 'Playa Dorada', '11:00', 'Baño', 60),
(3, 'Montaña Azul', '13:00', 'Senderismo', 90),
(4, 'Museo Histórico', '12:30', 'Visita Guiada', 45),
(5, 'Teatro Antiguo', '14:00', 'Espectáculo', 60),
(6, 'Cascada del Jaguar', '15:30', 'Excursión', 75),
(7, 'Viñedo del Valle', '16:00', 'Cata de vinos', 90),
(8, 'Mercado Gastronómico', '17:00', 'Degustación', 60),
(9, 'Taller Artesanal', '18:00', 'Demostración', 45),
(10, 'Catedral Gótica', '19:00', 'Misa y turismo', 30);
