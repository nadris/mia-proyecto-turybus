/*
Script de implementación para turybusOLTP

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "turybusOLTP"
:setvar DefaultFilePrefix "turybusOLTP"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detectar el modo SQLCMD y deshabilitar la ejecución del script si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creando Procedimiento [dbo].[GetDatabaseRowVersion]...';


GO
CREATE PROCEDURE [dbo].[GetDatabaseRowVersion]
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SET NOCOUNT ON

	SELECT DBTS = (CONVERT(BIGINT,MIN_ACTIVE_ROWVERSION())-1);
END
GO
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


PRINT 'Cleaning database';

DELETE FROM transporte.estadisticas_uso;
DELETE FROM transporte.revisiones_reparaciones;
DELETE FROM transporte.billetes;
DELETE FROM transporte.lugares_recorrido;
DELETE FROM transporte.autobuses_conductores;
DELETE FROM seguridad.pasajeros;
DELETE FROM transporte.rutas_servicios;

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

PRINT 'Populating pasajeros table';

INSERT INTO seguridad.pasajeros (dni, nombre, telefono) VALUES
('12345678A', 'Carlos Perez', '555-1010'),
('87654321B', 'Maria Lopez', '555-2020'),
('56789012C', 'Juan Gómez', '555-3030'),
('34567890D', 'Ana Torres', '555-4040'),
('98765432E', 'Luis Ramos', '555-5050'),
('23456789F', 'Sofia Vargas', '555-6060'),
('65432109G', 'Miguel Sanchez', '555-7070'),
('78901234H', 'Lucia Fernandez', '555-8080'),
('89012345I', 'Pablo Mendoza', '555-9090'),
('90123456J', 'Elena Rojas', '555-1111');


PRINT 'Populating billetes table';

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

PRINT 'Populating autobuses_conductores table';

INSERT INTO transporte.autobuses_conductores (matricula, modelo, fabricante, num_plazas, dni_conductor, nombre_conductor, telefono_conductor, direccion_conductor) VALUES
('ABC123', 'Volvo 9700', 'Volvo', 50, '11111111A', 'Pedro Martinez', '555-2222', 'Calle Falsa 123'),
('DEF456', 'Mercedes Tourismo', 'Mercedes-Benz', 45, '22222222B', 'Jorge Gonzalez', '555-3333', 'Avenida Central 456'),
('GHI789', 'Scania Irizar', 'Scania', 55, '33333333C', 'Rafael Suarez', '555-4444', 'Paseo de la Reforma 789'),
('JKL012', 'MAN Lion’s Coach', 'MAN', 40, '44444444D', 'Esteban Morales', '555-5555', 'Plaza Mayor 101'),
('MNO345', 'Setra TopClass', 'Setra', 60, '55555555E', 'Fernando Lopez', '555-6666', 'Boulevard Norte 202'),
('PQR678', 'Irizar i6', 'Irizar', 50, '66666666F', 'Carlos Rodríguez', '555-7777', 'Avenida del Sol 303'),
('STU901', 'Neoplan Skyliner', 'Neoplan', 70, '77777777G', 'Luis Gutierrez', '555-8888', 'Paseo Marítimo 404'),
('VWX234', 'Marcopolo Paradiso', 'Marcopolo', 65, '88888888H', 'Juan Morales', '555-9999', 'Calle del Río 505'),
('YZA567', 'Volvo B11R', 'Volvo', 50, '99999999I', 'José Sánchez', '555-0000', 'Avenida Universidad 606'),
('BCD890', 'Mercedes Sprinter', 'Mercedes-Benz', 30, '10101010J', 'Antonio Vargas', '555-1212', 'Calle de los Olivos 707');

PRINT 'Populating revisiones_reparaciones table';

INSERT INTO transporte.revisiones_reparaciones (matricula, fecha, diagnostico, codigo_reparacion, tiempo_empleado, comentario) VALUES
('ABC123', '2024-06-05', 'Cambio de aceite', 'REP001', 60, 'Sin anomalías'),
('DEF456', '2024-06-06', 'Cambio de frenos', 'REP002', 120, 'Reemplazo completo'),
('GHI789', '2024-06-07', 'Cambio de neumáticos', 'REP003', 90, 'Neumáticos delanteros'),
('JKL012', '2024-06-08', 'Revisión de motor', 'REP004', 180, 'Ajuste de válvulas'),
('MNO345', '2024-06-09', 'Cambio de batería', 'REP005', 45, 'Batería nueva instalada'),
('PQR678', '2024-06-10', 'Cambio de filtros', 'REP006', 60, 'Aire y combustible'),
('STU901', '2024-06-11', 'Cambio de luces', 'REP007', 30, 'Luces delanteras'),
('VWX234', '2024-06-12', 'Sistema de suspensión', 'REP008', 150, 'Reemplazo de amortiguadores'),
('YZA567', '2024-06-13', 'Cambio de dirección', 'REP009', 90, 'Alineación ajustada'),
('BCD890', '2024-06-14', 'Cambio de radiador', 'REP010', 120, 'Líquido refrigerante nuevo');

PRINT 'Populating estadisticas_uso table';

INSERT INTO transporte.estadisticas_uso (id_ruta_servicio, dni_pasajero, km_recorridos, horas_viaje) VALUES
(1, '12345678A', 150.5, 10),
(2, '87654321B', 120.0, 8),
(3, '56789012C', 200.0, 12),
(4, '34567890D', 90.0, 6);
GO

GO
PRINT N'Actualización completada.';


GO
