CREATE PROCEDURE [dbo].GetPasajerosChangesByRowVersion
(
   @startRow BIGINT,
   @endRow  BIGINT 
)
AS
BEGIN
	SELECT 
		dni,
		nombre,
		telefono
	  FROM seguridad.pasajeros
	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO