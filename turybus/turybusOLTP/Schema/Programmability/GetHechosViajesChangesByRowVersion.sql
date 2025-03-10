CREATE PROCEDURE [dbo].[GetHechosViajesChangesByRowVersion]
(
   @startRow BIGINT,
   @endRow  BIGINT 
)
AS
BEGIN
	SELECT
		eu.dni_pasajero, 
		rs.id_ruta_servicio, 
		ac.matricula, 
		ac.dni_conductor
	FROM
		transporte.estadisticas_uso eu
		INNER JOIN transporte.rutas_servicios rs
		ON eu.id_ruta_servicio = rs.id_ruta_servicio
		INNER JOIN transporte.autobuses_conductores ac
		ON rs.id_asignacion = ac.id_asignacion
	WHERE rs.rowversion > CONVERT(ROWVERSION, @startRow) 
	  AND rs.rowversion <= CONVERT(ROWVERSION, @endRow)
END
GO