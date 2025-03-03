/*
Script de implementación para turybus_prod

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "turybus_prod"
:setvar DefaultFilePrefix "turybus_prod"
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
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
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
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
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
PRINT N'Creando Clave externa [transporte].[fk_billetes_pasajeros]...';


GO
ALTER TABLE [transporte].[billetes] WITH NOCHECK
    ADD CONSTRAINT [fk_billetes_pasajeros] FOREIGN KEY ([dni_pasajero]) REFERENCES [seguridad].[pasajeros] ([dni]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [transporte].[fk_billetes_rutas_servicios]...';


GO
ALTER TABLE [transporte].[billetes] WITH NOCHECK
    ADD CONSTRAINT [fk_billetes_rutas_servicios] FOREIGN KEY ([id_ruta_servicio]) REFERENCES [transporte].[rutas_servicios] ([id_ruta_servicio]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [transporte].[fk_lugares_recorrido_rutas_servicios]...';


GO
ALTER TABLE [transporte].[lugares_recorrido] WITH NOCHECK
    ADD CONSTRAINT [fk_lugares_recorrido_rutas_servicios] FOREIGN KEY ([id_ruta_servicio]) REFERENCES [transporte].[rutas_servicios] ([id_ruta_servicio]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [transporte].[fk_revisiones_reparaciones_autobuses]...';


GO
ALTER TABLE [transporte].[revisiones_reparaciones] WITH NOCHECK
    ADD CONSTRAINT [fk_revisiones_reparaciones_autobuses] FOREIGN KEY ([matricula]) REFERENCES [transporte].[autobuses_conductores] ([matricula]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [transporte].[fk_estadisticas_uso_rutas_servicios]...';


GO
ALTER TABLE [transporte].[estadisticas_uso] WITH NOCHECK
    ADD CONSTRAINT [fk_estadisticas_uso_rutas_servicios] FOREIGN KEY ([id_ruta_servicio]) REFERENCES [transporte].[rutas_servicios] ([id_ruta_servicio]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [transporte].[fk_estadisticas_uso_pasajeros]...';


GO
ALTER TABLE [transporte].[estadisticas_uso] WITH NOCHECK
    ADD CONSTRAINT [fk_estadisticas_uso_pasajeros] FOREIGN KEY ([dni_pasajero]) REFERENCES [seguridad].[pasajeros] ([dni]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Restricción CHECK [transporte].[chk_importe]...';


GO
ALTER TABLE [transporte].[rutas_servicios] WITH NOCHECK
    ADD CONSTRAINT [chk_importe] CHECK (importe > 0);


GO
PRINT N'Creando Restricción CHECK [transporte].[chk_num_plazas]...';


GO
ALTER TABLE [transporte].[autobuses_conductores] WITH NOCHECK
    ADD CONSTRAINT [chk_num_plazas] CHECK (num_plazas > 0);


GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [transporte].[billetes] WITH CHECK CHECK CONSTRAINT [fk_billetes_pasajeros];

ALTER TABLE [transporte].[billetes] WITH CHECK CHECK CONSTRAINT [fk_billetes_rutas_servicios];

ALTER TABLE [transporte].[lugares_recorrido] WITH CHECK CHECK CONSTRAINT [fk_lugares_recorrido_rutas_servicios];

ALTER TABLE [transporte].[revisiones_reparaciones] WITH CHECK CHECK CONSTRAINT [fk_revisiones_reparaciones_autobuses];

ALTER TABLE [transporte].[estadisticas_uso] WITH CHECK CHECK CONSTRAINT [fk_estadisticas_uso_rutas_servicios];

ALTER TABLE [transporte].[estadisticas_uso] WITH CHECK CHECK CONSTRAINT [fk_estadisticas_uso_pasajeros];

ALTER TABLE [transporte].[rutas_servicios] WITH CHECK CHECK CONSTRAINT [chk_importe];

ALTER TABLE [transporte].[autobuses_conductores] WITH CHECK CHECK CONSTRAINT [chk_num_plazas];


GO
PRINT N'Actualización completada.';


GO
