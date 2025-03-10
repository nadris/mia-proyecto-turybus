CREATE PROCEDURE [dbo].GetAutobusesChangesByRowVersion
(
   @startRow BIGINT,
   @endRow  BIGINT 
)
AS
BEGIN
	SELECT 
		matricula,
		modelo,
		fabricante,
		num_plazas
	  FROM transporte.autobuses_conductores
	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO