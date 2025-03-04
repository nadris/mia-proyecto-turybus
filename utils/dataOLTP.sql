-- Insertar datos en la tabla rutas_servicios
INSERT INTO transporte.rutas_servicios (nombre, importe, hora_salida, hora_llegada, dias_programados) VALUES
('Ruta Andina', 50.00, '08:00', '18:00', 'Lunes-Viernes'),
('Ruta Costera', 70.00, '09:00', '17:30', 'Todos'),
('Ruta Monta�osa', 85.00, '07:30', '19:00', 'Sabado-Domingo'),
('Ruta Hist�rica', 60.00, '10:00', '16:00', 'Miercoles-Viernes'),
('Ruta Cultural', 45.00, '11:00', '15:00', 'Martes-Jueves'),
('Ruta Selv�tica', 90.00, '06:00', '20:00', 'Todos'),
('Ruta Vin�cola', 75.00, '12:00', '18:30', 'Viernes-Domingo'),
('Ruta Gastron�mica', 55.00, '13:00', '19:30', 'Todos'),
('Ruta Artesanal', 40.00, '14:00', '17:00', 'Martes-Sabado'),
('Ruta Religiosa', 50.00, '15:00', '20:00', 'Domingo');

-- Insertar datos en la tabla pasajeros
INSERT INTO seguridad.pasajeros (dni, nombre, telefono) VALUES
('12345678A', 'Carlos Perez', '555-1010'),
('87654321B', 'Maria Lopez', '555-2020'),
('56789012C', 'Juan G�mez', '555-3030'),
('34567890D', 'Ana Torres', '555-4040'),
('98765432E', 'Luis Ramos', '555-5050'),
('23456789F', 'Sofia Vargas', '555-6060'),
('65432109G', 'Miguel Sanchez', '555-7070'),
('78901234H', 'Lucia Fernandez', '555-8080'),
('89012345I', 'Pablo Mendoza', '555-9090'),
('90123456J', 'Elena Rojas', '555-1111');

-- Insertar datos en la tabla billetes
INSERT INTO transporte.billetes (dni_pasajero, id_ruta_servicio, fecha, importe) VALUES
('12345678A', 1, '2024-06-10', 50.00),
('87654321B', 2, '2024-06-11', 70.00),
('56789012C', 3, '2024-06-12', 85.00),
('34567890D', 4, '2024-06-13', 60.00),
('98765432E', 5, '2024-06-14', 45.00),
('23456789F', 6, '2024-06-15', 90.00),
('65432109G', 7, '2024-06-16', 75.00),
('78901234H', 8, '2024-06-17', 55.00),
('89012345I', 9, '2024-06-18', 40.00),
('90123456J', 10, '2024-06-19', 50.00);

-- Insertar datos en la tabla lugares_recorrido
INSERT INTO transporte.lugares_recorrido (id_ruta_servicio, nombre, hora_llegada, actividad, tiempo_parada) VALUES
(1, 'Mirador Andino', '10:00', 'Fotograf�a', 30),
(2, 'Playa Dorada', '11:00', 'Ba�o', 60),
(3, 'Monta�a Azul', '13:00', 'Senderismo', 90),
(4, 'Museo Hist�rico', '12:30', 'Visita Guiada', 45),
(5, 'Teatro Antiguo', '14:00', 'Espect�culo', 60),
(6, 'Cascada del Jaguar', '15:30', 'Excursi�n', 75),
(7, 'Vi�edo del Valle', '16:00', 'Cata de vinos', 90),
(8, 'Mercado Gastron�mico', '17:00', 'Degustaci�n', 60),
(9, 'Taller Artesanal', '18:00', 'Demostraci�n', 45),
(10, 'Catedral G�tica', '19:00', 'Misa y turismo', 30);

-- Insertar datos en la tabla autobuses_conductores
INSERT INTO transporte.autobuses_conductores (matricula, modelo, fabricante, num_plazas, dni_conductor, nombre_conductor, telefono_conductor, direccion_conductor) VALUES
('ABC123', 'Volvo 9700', 'Volvo', 50, '11111111A', 'Pedro Martinez', '555-2222', 'Calle Falsa 123'),
('DEF456', 'Mercedes Tourismo', 'Mercedes-Benz', 45, '22222222B', 'Jorge Gonzalez', '555-3333', 'Avenida Central 456'),
('GHI789', 'Scania Irizar', 'Scania', 55, '33333333C', 'Rafael Suarez', '555-4444', 'Paseo de la Reforma 789'),
('JKL012', 'MAN Lion�s Coach', 'MAN', 40, '44444444D', 'Esteban Morales', '555-5555', 'Plaza Mayor 101'),
('MNO345', 'Setra TopClass', 'Setra', 60, '55555555E', 'Fernando Lopez', '555-6666', 'Boulevard Norte 202'),
('PQR678', 'Irizar i6', 'Irizar', 50, '66666666F', 'Carlos Rodr�guez', '555-7777', 'Avenida del Sol 303'),
('STU901', 'Neoplan Skyliner', 'Neoplan', 70, '77777777G', 'Luis Gutierrez', '555-8888', 'Paseo Mar�timo 404'),
('VWX234', 'Marcopolo Paradiso', 'Marcopolo', 65, '88888888H', 'Juan Morales', '555-9999', 'Calle del R�o 505'),
('YZA567', 'Volvo B11R', 'Volvo', 50, '99999999I', 'Jos� S�nchez', '555-0000', 'Avenida Universidad 606'),
('BCD890', 'Mercedes Sprinter', 'Mercedes-Benz', 30, '10101010J', 'Antonio Vargas', '555-1212', 'Calle de los Olivos 707');

-- Insertar datos en la tabla revisiones_reparaciones
INSERT INTO transporte.revisiones_reparaciones (matricula, fecha, diagnostico, codigo_reparacion, tiempo_empleado, comentario) VALUES
('ABC123', '2024-06-05', 'Cambio de aceite', 'REP001', 60, 'Sin anomal�as'),
('DEF456', '2024-06-06', 'Cambio de frenos', 'REP002', 120, 'Reemplazo completo'),
('GHI789', '2024-06-07', 'Cambio de neum�ticos', 'REP003', 90, 'Neum�ticos delanteros'),
('JKL012', '2024-06-08', 'Revisi�n de motor', 'REP004', 180, 'Ajuste de v�lvulas'),
('MNO345', '2024-06-09', 'Cambio de bater�a', 'REP005', 45, 'Bater�a nueva instalada'),
('PQR678', '2024-06-10', 'Cambio de filtros', 'REP006', 60, 'Aire y combustible'),
('STU901', '2024-06-11', 'Cambio de luces', 'REP007', 30, 'Luces delanteras'),
('VWX234', '2024-06-12', 'Sistema de suspensi�n', 'REP008', 150, 'Reemplazo de amortiguadores'),
('YZA567', '2024-06-13', 'Cambio de direcci�n', 'REP009', 90, 'Alineaci�n ajustada'),
('BCD890', '2024-06-14', 'Cambio de radiador', 'REP010', 120, 'L�quido refrigerante nuevo');

-- Insertar datos en la tabla estadisticas_uso
INSERT INTO transporte.estadisticas_uso (id_ruta_servicio, dni_pasajero, km_recorridos, horas_viaje) VALUES
(1, '12345678A', 150.5, 10),
(2, '87654321B', 120.0, 8),
(3, '56789012C', 200.0, 12),
(4, '34567890D', 90.0, 6);