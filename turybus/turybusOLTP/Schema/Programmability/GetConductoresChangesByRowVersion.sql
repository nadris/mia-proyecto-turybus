CREATE PROCEDURE [dbo].GetConductoresChangesByRowVersion
(
   @startRow BIGINT,
   @endRow  BIGINT 
)
AS
BEGIN
	SELECT 
		dni_conductor,
		nombre_conductor,
		telefono_conductor
	  FROM transporte.autobuses_conductores
	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO