/*
Plantilla de script posterior a la implementación							
--------------------------------------------------------------------------------------
 Este archivo contiene instrucciones de SQL que se anexarán al script de compilación.		
 Use la sintaxis de SQLCMD para incluir un archivo en el script posterior a la implementación.			
 Ejemplo:      :r .\miArchivo.sql								
 Use la sintaxis de SQLCMD para hacer referencia a una variable en el script posterior a la implementación.		
 Ejemplo:      :setvar TableName miTabla							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


DELETE FROM transporte.estadisticas_uso;
DELETE FROM transporte.revisiones_reparaciones;
DELETE FROM transporte.billetes;
DELETE FROM transporte.lugares_recorrido;
DELETE FROM transporte.autobuses_conductores;
DELETE FROM seguridad.pasajeros;
DELETE FROM transporte.rutas_servicios;

DBCC CHECKIDENT ('transporte.estadisticas_uso', RESEED, 0);
DBCC CHECKIDENT ('transporte.revisiones_reparaciones', RESEED, 0);
DBCC CHECKIDENT ('transporte.billetes', RESEED, 0);
DBCC CHECKIDENT ('transporte.lugares_recorrido', RESEED, 0);
DBCC CHECKIDENT ('transporte.autobuses_conductores', RESEED, 0);
DBCC CHECKIDENT ('transporte.rutas_servicios', RESEED, 0);

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
PRINT 'Populating pasajeros table';
SET NOCOUNT ON;

SET IDENTITY_INSERT seguridad.pasajeros ON;

INSERT INTO seguridad.pasajeros (dni, nombre, telefono) VALUES
('12345678A', 'Juan Pérez', '555-0101'),
('23456789B', 'María López', '555-0102'),
('34567890C', 'Carlos García', '555-0103'),
('45678901D', 'Ana Fernández', '555-0104'),
('56789012E', 'Luis Martínez', '555-0105'),
('67890123F', 'Sofía Rodríguez', '555-0106'),
('78901234G', 'Miguel Torres', '555-0107'),
('89012345H', 'Laura Díaz', '555-0108'),
('90123456I', 'Pedro Ramírez', '555-0109'),
('01234567J', 'Andrea Gómez', '555-0110');

SET IDENTITY_INSERT seguridad.pasajeros OFF;
PRINT 'Populating billetes table';
SET NOCOUNT ON;

SET IDENTITY_INSERT transporte.billetes ON;


INSERT INTO transporte.billetes (dni_pasajero, id_ruta_servicio, fecha, importe) VALUES
('12345678A', 1, '2024-03-01', 10.50),
('23456789B', 2, '2024-03-02', 15.75),
('34567890C', 3, '2024-03-03', 12.00),
('45678901D', 4, '2024-03-04', 8.25),
('56789012E', 5, '2024-03-05', 18.90),
('67890123F', 6, '2024-03-06', 9.50),
('78901234G', 7, '2024-03-07', 20.00),
('89012345H', 8, '2024-03-08', 11.25),
('90123456I', 9, '2024-03-09', 14.60),
('01234567J', 10, '2024-03-10', 7.80);

SET IDENTITY_INSERT transporte.billetes OFF;
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
PRINT 'Populating autobuses_conductores table';
SET NOCOUNT ON;

SET IDENTITY_INSERT transporte.autobuses_conductores ON;

INSERT INTO transporte.autobuses_conductores (matricula, modelo, fabricante, num_plazas, dni_conductor, nombre_conductor, telefono_conductor, direccion_conductor) VALUES
('ABC123', 'Volvo B12', 'Volvo', 50, '12345678A', 'Mario Herrera', '555-0201', 'Calle 1'),
('DEF456', 'Scania K310', 'Scania', 45, '23456789B', 'Ricardo Vega', '555-0202', 'Calle 2'),
('GHI789', 'Mercedes Sprinter', 'Mercedes', 20, '34567890C', 'Daniel Ponce', '555-0203', 'Calle 3'),
('JKL012', 'MAN Lions Coach', 'MAN', 55, '45678901D', 'Ernesto Campos', '555-0204', 'Calle 4'),
('MNO345', 'Irizar i6', 'Irizar', 48, '56789012E', 'Fernando López', '555-0205', 'Calle 5');


SET IDENTITY_INSERT transporte.autobuses_conductores OFF;
PRINT 'Populating revisiones_reparaciones table';
SET NOCOUNT ON;

SET IDENTITY_INSERT transporte.revisiones_reparaciones ON;

INSERT INTO transporte.revisiones_reparaciones (matricula, fecha, diagnostico, codigo_reparacion, tiempo_empleado, comentario) VALUES
('ABC123', '2024-03-01', 'Cambio de aceite', 'R001', 30, 'Revisión periódica'),
('DEF456', '2024-03-02', 'Frenos desgastados', 'R002', 60, 'Sustitución de pastillas de freno');

SET IDENTITY_INSERT transporte.revisiones_reparaciones OFF;
PRINT 'Populating estadisticas_uso table';
SET NOCOUNT ON;

SET IDENTITY_INSERT transporte.estadisticas_uso ON;

INSERT INTO transporte.estadisticas_uso (id_ruta_servicio, dni_pasajero, km_recorridos, horas_viaje) VALUES
(1, '12345678A', 120.5, 2.0),
(2, '23456789B', 180.3, 3.5),
(3, '34567890C', 90.0, 1.5),
(4, '45678901D', 150.2, 2.8),
(5, '56789012E', 210.6, 4.0),
(6, '67890123F', 100.0, 2.0),
(7, '78901234G', 250.7, 5.0),
(8, '89012345H', 130.4, 2.2),
(9, '90123456I', 170.9, 3.1),
(10, '01234567J', 75.8, 1.3);

SET IDENTITY_INSERT transporte.estadisticas_uso OFF;
GO
