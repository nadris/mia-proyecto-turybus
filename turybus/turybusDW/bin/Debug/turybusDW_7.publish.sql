/*
Script de implementación para turybusDW

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "turybusDW"
:setvar DefaultFilePrefix "turybusDW"
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
PRINT N'Creando Esquema [dwh]...';


GO
CREATE SCHEMA [dwh]
    AUTHORIZATION [dbo];


GO
PRINT N'Creando Tabla [dwh].[PackageConfig]...';


GO
CREATE TABLE [dwh].[PackageConfig] (
    [PackageID]      INT          IDENTITY (1, 1) NOT NULL,
    [TableName]      VARCHAR (50) NOT NULL,
    [LastRowVersion] BIGINT       NULL,
    CONSTRAINT [PK_PackageConfig] PRIMARY KEY CLUSTERED ([PackageID] ASC)
);


GO
PRINT N'Creando Tabla [dwh].[hechos_viajes]...';


GO
CREATE TABLE [dwh].[hechos_viajes] (
    [dni_pasajero]     NVARCHAR (20) NOT NULL,
    [id_ruta_servicio] INT           NOT NULL,
    [matricula]        NVARCHAR (20) NOT NULL,
    [dni_conductor]    NVARCHAR (20) NOT NULL
);


GO
PRINT N'Creando Tabla [dwh].[dim_conductores]...';


GO
CREATE TABLE [dwh].[dim_conductores] (
    [dni_conductor]      NVARCHAR (20)  NOT NULL,
    [nombre_conductor]   NVARCHAR (255) NOT NULL,
    [telefono_conductor] NVARCHAR (20)  NOT NULL,
    PRIMARY KEY CLUSTERED ([dni_conductor] ASC),
    UNIQUE NONCLUSTERED ([dni_conductor] ASC)
);


GO
PRINT N'Creando Tabla [dwh].[dim_autobuses]...';


GO
CREATE TABLE [dwh].[dim_autobuses] (
    [matricula]  NVARCHAR (20)  NOT NULL,
    [modelo]     NVARCHAR (255) NOT NULL,
    [fabricante] NVARCHAR (255) NOT NULL,
    [num_plazas] INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([matricula] ASC),
    UNIQUE NONCLUSTERED ([matricula] ASC)
);


GO
PRINT N'Creando Tabla [dwh].[dim_rutas_servicios]...';


GO
CREATE TABLE [dwh].[dim_rutas_servicios] (
    [id_ruta_servicio] INT             NOT NULL,
    [nombre]           NVARCHAR (255)  NOT NULL,
    [importe]          DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([id_ruta_servicio] ASC)
);


GO
PRINT N'Creando Tabla [dwh].[dim_pasajeros]...';


GO
CREATE TABLE [dwh].[dim_pasajeros] (
    [dni]      NVARCHAR (20)  NOT NULL,
    [nombre]   NVARCHAR (255) NOT NULL,
    [telefono] NVARCHAR (20)  NOT NULL,
    PRIMARY KEY CLUSTERED ([dni] ASC),
    UNIQUE NONCLUSTERED ([dni] ASC)
);


GO
PRINT N'Creando Clave externa [dwh].[fk_hechos_viajes_pasajeros]...';


GO
ALTER TABLE [dwh].[hechos_viajes]
    ADD CONSTRAINT [fk_hechos_viajes_pasajeros] FOREIGN KEY ([dni_pasajero]) REFERENCES [dwh].[dim_pasajeros] ([dni]);


GO
PRINT N'Creando Clave externa [dwh].[fk_hechos_viajes_rutas_servicios]...';


GO
ALTER TABLE [dwh].[hechos_viajes]
    ADD CONSTRAINT [fk_hechos_viajes_rutas_servicios] FOREIGN KEY ([id_ruta_servicio]) REFERENCES [dwh].[dim_rutas_servicios] ([id_ruta_servicio]);


GO
PRINT N'Creando Clave externa [dwh].[fk_hechos_viajes_autobuses]...';


GO
ALTER TABLE [dwh].[hechos_viajes]
    ADD CONSTRAINT [fk_hechos_viajes_autobuses] FOREIGN KEY ([matricula]) REFERENCES [dwh].[dim_autobuses] ([matricula]);


GO
PRINT N'Creando Clave externa [dwh].[fk_hechos_viajes_conductores]...';


GO
ALTER TABLE [dwh].[hechos_viajes]
    ADD CONSTRAINT [fk_hechos_viajes_conductores] FOREIGN KEY ([dni_conductor]) REFERENCES [dwh].[dim_conductores] ([dni_conductor]);


GO
PRINT N'Creando Procedimiento [dwh].[GetLastPackageRowVersion]...';


GO
CREATE PROCEDURE [dwh].[GetLastPackageRowVersion]
(
	@tableName VARCHAR(50)
)
  AS
  BEGIN
	SELECT LastRowVersion
	FROM [dwh].[PackageConfig]
	WHERE TableName = @tableName;
  END
GO
PRINT N'Creando Procedimiento [dbo].[UpdateLastPackageRowVersion]...';


GO
CREATE PROCEDURE [dbo].[UpdateLastPackageRowVersion]
  (
	@tableName VARCHAR(50),
	@lastRowVersion BIGINT
  )
  AS
  BEGIN
	UPDATE [dwh].[PackageConfig]
	SET LastRowVersion = @lastRowVersion
	WHERE TableName = @tableName;
  END
GO
IF NOT EXISTS(SELECT TOP(1) 1
              FROM [dwh].[PackageConfig]
			  WHERE [TableName] = 'dim_autobuses')
 BEGIN
	INSERT [dwh].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('dim_autobuses', 0)
 END
GO

IF NOT EXISTS(SELECT TOP(1) 1
              FROM [dwh].[PackageConfig]
			  WHERE [TableName] = 'dim_conductores')
 BEGIN
	INSERT [dwh].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('dim_conductores', 0)
 END
GO

IF NOT EXISTS(SELECT TOP(1) 1
              FROM [dwh].[PackageConfig]
			  WHERE [TableName] = 'dim_pasajeros')
 BEGIN
  INSERT [dwh].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('dim_pasajeros', 0)
 END
GO

IF NOT EXISTS(SELECT TOP(1) 1
              FROM [dwh].[PackageConfig]
			  WHERE [TableName] = 'dim_rutas_servicios')
 BEGIN
	INSERT [dwh].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('dim_rutas_servicios', 0)
 END
GO

IF NOT EXISTS(SELECT TOP(1) 1
              FROM [dwh].[PackageConfig]
			  WHERE [TableName] = 'hechos_viajes')
 BEGIN
	INSERT [dwh].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('hechos_viajes', 0)
 END
GO

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
