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