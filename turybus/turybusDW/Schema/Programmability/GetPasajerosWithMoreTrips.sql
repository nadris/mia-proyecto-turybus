CREATE PROCEDURE [dwh].[GetPasajerosWithMoreTrips]
  AS
  BEGIN
	WITH viajes_por_pasajero AS (
    SELECT 
            h.dni_pasajero,
            COUNT(h.dni_pasajero) AS total_viajes,
            RANK() OVER (ORDER BY COUNT(h.HechosViajesSK) DESC) AS rnk
        FROM dwh.hechos_viajes h
        GROUP BY h.dni_pasajero
    )
    SELECT dni_pasajero, total_viajes
    FROM viajes_por_pasajero
    WHERE rnk = 1;
  END
GO