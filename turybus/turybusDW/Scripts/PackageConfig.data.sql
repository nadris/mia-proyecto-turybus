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
