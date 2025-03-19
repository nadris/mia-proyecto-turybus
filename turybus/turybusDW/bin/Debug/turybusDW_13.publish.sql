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
USE [$(DatabaseName)];


GO
PRINT N'Quitando Restricción UNIQUE restricción sin nombre en [dwh].[dim_conductores]...';


GO
ALTER TABLE [dwh].[dim_conductores] DROP CONSTRAINT [UQ__dim_cond__59B4EE36668EE550];


GO
PRINT N'Quitando Restricción UNIQUE restricción sin nombre en [dwh].[dim_pasajeros]...';


GO
ALTER TABLE [dwh].[dim_pasajeros] DROP CONSTRAINT [UQ__dim_pasa__D87608A79178CC25];


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
PRINT N'Actualización completada.';


GO
