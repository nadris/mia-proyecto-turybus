/*
Script de implementación para chonta

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "chonta"
:setvar DefaultFilePrefix "chonta"
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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creando la base de datos $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'No se puede modificar la configuración de la base de datos. Debe ser un administrador del sistema para poder aplicar esta configuración.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'No se puede modificar la configuración de la base de datos. Debe ser un administrador del sistema para poder aplicar esta configuración.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creando Esquema [seguridad]...';


GO
CREATE SCHEMA [seguridad]
    AUTHORIZATION [dbo];


GO
PRINT N'Creando Esquema [transporte]...';


GO
CREATE SCHEMA [transporte]
    AUTHORIZATION [dbo];


GO
PRINT N'Creando Tabla [seguridad].[pasajeros]...';


GO
CREATE TABLE [seguridad].[pasajeros] (
    [dni]      NVARCHAR (20)  NOT NULL,
    [nombre]   NVARCHAR (255) NOT NULL,
    [telefono] NVARCHAR (20)  NOT NULL,
    PRIMARY KEY CLUSTERED ([dni] ASC),
    CONSTRAINT [uq_pasajeros_telefono] UNIQUE NONCLUSTERED ([telefono] ASC)
);


GO
PRINT N'Creando Tabla [transporte].[estadisticas_uso]...';


GO
CREATE TABLE [transporte].[estadisticas_uso] (
    [id_estadistica]   INT             IDENTITY (1, 1) NOT NULL,
    [id_ruta_servicio] INT             NOT NULL,
    [dni_pasajero]     NVARCHAR (20)   NULL,
    [km_recorridos]    DECIMAL (10, 2) NOT NULL,
    [horas_viaje]      DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([id_estadistica] ASC)
);


GO
PRINT N'Creando Tabla [transporte].[revisiones_reparaciones]...';


GO
CREATE TABLE [transporte].[revisiones_reparaciones] (
    [id_revision]       INT           IDENTITY (1, 1) NOT NULL,
    [matricula]         NVARCHAR (20) NOT NULL,
    [fecha]             DATE          NOT NULL,
    [diagnostico]       TEXT          NULL,
    [codigo_reparacion] NVARCHAR (50) NULL,
    [tiempo_empleado]   INT           NULL,
    [comentario]        TEXT          NULL,
    PRIMARY KEY CLUSTERED ([id_revision] ASC)
);


GO
PRINT N'Creando Tabla [transporte].[autobuses_conductores]...';


GO
CREATE TABLE [transporte].[autobuses_conductores] (
    [id_asignacion]       INT            IDENTITY (1, 1) NOT NULL,
    [matricula]           NVARCHAR (20)  NOT NULL,
    [modelo]              NVARCHAR (255) NOT NULL,
    [fabricante]          NVARCHAR (255) NOT NULL,
    [num_plazas]          INT            NOT NULL,
    [dni_conductor]       NVARCHAR (20)  NOT NULL,
    [nombre_conductor]    NVARCHAR (255) NOT NULL,
    [telefono_conductor]  NVARCHAR (20)  NOT NULL,
    [direccion_conductor] NVARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([id_asignacion] ASC),
    UNIQUE NONCLUSTERED ([matricula] ASC)
);


GO
PRINT N'Creando Tabla [transporte].[lugares_recorrido]...';


GO
CREATE TABLE [transporte].[lugares_recorrido] (
    [id_lugar]         INT            IDENTITY (1, 1) NOT NULL,
    [id_ruta_servicio] INT            NOT NULL,
    [nombre]           NVARCHAR (255) NOT NULL,
    [hora_llegada]     TIME (7)       NOT NULL,
    [actividad]        NVARCHAR (255) NULL,
    [tiempo_parada]    INT            NULL,
    PRIMARY KEY CLUSTERED ([id_lugar] ASC)
);


GO
PRINT N'Creando Tabla [transporte].[billetes]...';


GO
CREATE TABLE [transporte].[billetes] (
    [id_billete]       INT             IDENTITY (1, 1) NOT NULL,
    [dni_pasajero]     NVARCHAR (20)   NOT NULL,
    [id_ruta_servicio] INT             NOT NULL,
    [fecha]            DATE            NOT NULL,
    [importe]          DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([id_billete] ASC)
);


GO
PRINT N'Creando Tabla [transporte].[rutas_servicios]...';


GO
CREATE TABLE [transporte].[rutas_servicios] (
    [id_ruta_servicio] INT             IDENTITY (1, 1) NOT NULL,
    [nombre]           NVARCHAR (255)  NOT NULL,
    [importe]          DECIMAL (10, 2) NOT NULL,
    [hora_salida]      TIME (7)        NOT NULL,
    [hora_llegada]     TIME (7)        NOT NULL,
    [dias_programados] NVARCHAR (50)   NOT NULL,
    PRIMARY KEY CLUSTERED ([id_ruta_servicio] ASC)
);


GO
PRINT N'Creando Clave externa [transporte].[fk_estadisticas_uso_rutas_servicios]...';


GO
ALTER TABLE [transporte].[estadisticas_uso]
    ADD CONSTRAINT [fk_estadisticas_uso_rutas_servicios] FOREIGN KEY ([id_ruta_servicio]) REFERENCES [transporte].[rutas_servicios] ([id_ruta_servicio]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [transporte].[fk_estadisticas_uso_pasajeros]...';


GO
ALTER TABLE [transporte].[estadisticas_uso]
    ADD CONSTRAINT [fk_estadisticas_uso_pasajeros] FOREIGN KEY ([dni_pasajero]) REFERENCES [seguridad].[pasajeros] ([dni]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [transporte].[fk_revisiones_reparaciones_autobuses]...';


GO
ALTER TABLE [transporte].[revisiones_reparaciones]
    ADD CONSTRAINT [fk_revisiones_reparaciones_autobuses] FOREIGN KEY ([matricula]) REFERENCES [transporte].[autobuses_conductores] ([matricula]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [transporte].[fk_lugares_recorrido_rutas_servicios]...';


GO
ALTER TABLE [transporte].[lugares_recorrido]
    ADD CONSTRAINT [fk_lugares_recorrido_rutas_servicios] FOREIGN KEY ([id_ruta_servicio]) REFERENCES [transporte].[rutas_servicios] ([id_ruta_servicio]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [transporte].[fk_billetes_pasajeros]...';


GO
ALTER TABLE [transporte].[billetes]
    ADD CONSTRAINT [fk_billetes_pasajeros] FOREIGN KEY ([dni_pasajero]) REFERENCES [seguridad].[pasajeros] ([dni]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [transporte].[fk_billetes_rutas_servicios]...';


GO
ALTER TABLE [transporte].[billetes]
    ADD CONSTRAINT [fk_billetes_rutas_servicios] FOREIGN KEY ([id_ruta_servicio]) REFERENCES [transporte].[rutas_servicios] ([id_ruta_servicio]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Restricción CHECK [transporte].[chk_num_plazas]...';


GO
ALTER TABLE [transporte].[autobuses_conductores]
    ADD CONSTRAINT [chk_num_plazas] CHECK (num_plazas > 0);


GO
PRINT N'Creando Restricción CHECK [transporte].[chk_importe]...';


GO
ALTER TABLE [transporte].[rutas_servicios]
    ADD CONSTRAINT [chk_importe] CHECK (importe > 0);


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

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Actualización completada.';


GO
