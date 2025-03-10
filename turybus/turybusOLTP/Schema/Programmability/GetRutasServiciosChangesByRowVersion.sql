CREATE PROCEDURE [dbo].[GetRutasServiciosChangesByRowVersion]
(
   @startRow BIGINT,
   @endRow  BIGINT 
)
AS
BEGIN
	SELECT 
		id_ruta_servicio,
		nombre,
		importe
	  FROM transporte.rutas_servicios
	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO