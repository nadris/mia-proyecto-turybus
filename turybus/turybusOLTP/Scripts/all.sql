-- Eliminar datos en orden correcto debido a las restricciones de clave foránea
DELETE FROM transporte.estadisticas_uso;
DELETE FROM transporte.revisiones_reparaciones;
DELETE FROM transporte.billetes;
DELETE FROM transporte.lugares_recorrido;
DELETE FROM transporte.autobuses_conductores;
DELETE FROM seguridad.pasajeros;
DELETE FROM transporte.rutas_servicios;

-- Reiniciar contadores de identidad
DBCC CHECKIDENT ('transporte.estadisticas_uso', RESEED, 0);
DBCC CHECKIDENT ('transporte.revisiones_reparaciones', RESEED, 0);
DBCC CHECKIDENT ('transporte.billetes', RESEED, 0);
DBCC CHECKIDENT ('transporte.lugares_recorrido', RESEED, 0);
DBCC CHECKIDENT ('transporte.autobuses_conductores', RESEED, 0);
DBCC CHECKIDENT ('transporte.rutas_servicios', RESEED, 0);

-- Reinserción de datos

-- Insertar rutas y servicios
INSERT INTO transporte.rutas_servicios (nombre, importe, hora_salida, hora_llegada, dias_programados) VALUES
('Ruta 1', 50.00, '08:00', '12:00', 'Lunes-Viernes'),
('Ruta 2', 75.00, '09:30', '14:00', 'Todos los días'),
('Ruta 3', 40.00, '07:00', '11:30', 'Lunes-Miércoles-Viernes'),
('Ruta 4', 60.00, '06:45', '10:45', 'Martes-Jueves-Sábado'),
('Ruta 5', 90.00, '10:00', '15:00', 'Domingo'),
('Ruta 6', 55.00, '12:00', '16:00', 'Lunes a Sábado'),
('Ruta 7', 70.00, '14:30', '19:00', 'Viernes y Sábado'),
('Ruta 8', 85.00, '17:00', '22:00', 'Lunes-Miércoles-Viernes'),
('Ruta 9', 45.00, '05:30', '09:30', 'Martes y Jueves'),
('Ruta 10', 100.00, '20:00', '01:00', 'Sábado y Domingo');

-- Insertar pasajeros
INSERT INTO seguridad.pasajeros (dni, nombre, telefono) VALUES
('12345678A', 'Juan Pérez', '1111111111'),
('23456789B', 'María Gómez', '2222222222'),
('34567890C', 'Carlos López', '3333333333'),
('45678901D', 'Ana Fernández', '4444444444'),
('56789012E', 'Pedro Ramírez', '5555555555'),
('67890123F', 'Laura Sánchez', '6666666666'),
('78901234G', 'Jorge Herrera', '7777777777'),
('89012345H', 'Sofía Díaz', '8888888888'),
('90123456I', 'Daniel Ortega', '9999999999'),
('01234567J', 'Lucía Castro', '1010101010');

-- Insertar billetes
INSERT INTO transporte.billetes (dni_pasajero, id_ruta_servicio, fecha, importe) VALUES
('12345678A', 1, '2024-03-01', 50.00),
('23456789B', 2, '2024-03-02', 75.00),
('34567890C', 3, '2024-03-03', 40.00),
('45678901D', 4, '2024-03-04', 60.00),
('56789012E', 5, '2024-03-05', 90.00),
('67890123F', 6, '2024-03-06', 55.00),
('78901234G', 7, '2024-03-07', 70.00),
('89012345H', 8, '2024-03-08', 85.00),
('90123456I', 9, '2024-03-09', 45.00),
('01234567J', 10, '2024-03-10', 100.00);

-- Insertar lugares del recorrido
INSERT INTO transporte.lugares_recorrido (id_ruta_servicio, nombre, hora_llegada, actividad, tiempo_parada) VALUES
(1, 'Estación Central', '09:00', 'Parada breve', 15),
(2, 'Plaza Mayor', '10:15', 'Descanso', 20),
(3, 'Terminal Norte', '08:30', 'Parada técnica', 10),
(4, 'Punto de control', '09:45', 'Revisión', 5),
(5, 'Parada Sur', '11:00', 'Cambio de conductor', 30),
(6, 'Estación Oeste', '13:15', 'Descanso', 20),
(7, 'Centro Comercial', '15:00', 'Carga de pasajeros', 25),
(8, 'Aeropuerto', '18:30', 'Llegada', 0),
(9, 'Puerto', '07:45', 'Embarque', 15),
(10, 'Zona Residencial', '21:30', 'Última parada', 10);

-- Insertar autobuses y conductores
INSERT INTO transporte.autobuses_conductores (matricula, modelo, fabricante, num_plazas, dni_conductor, nombre_conductor, telefono_conductor, direccion_conductor) VALUES
('ABC123', 'Volvo 9700', 'Volvo', 50, '12345678A', 'Luis Martínez', '111222333', 'Calle 1, Ciudad A'),
('DEF456', 'Mercedes-Benz Tourismo', 'Mercedes-Benz', 55, '23456789B', 'Marta Rodríguez', '222333444', 'Calle 2, Ciudad B'),
('GHI789', 'Irizar i6', 'Irizar', 45, '34567890C', 'Carlos Fernández', '333444555', 'Calle 3, Ciudad C'),
('JKL012', 'Scania K360', 'Scania', 60, '45678901D', 'Ana Gutiérrez', '444555666', 'Calle 4, Ciudad D'),
('MNO345', 'MAN Lion’s Coach', 'MAN', 50, '56789012E', 'Pedro Molina', '555666777', 'Calle 5, Ciudad E');
