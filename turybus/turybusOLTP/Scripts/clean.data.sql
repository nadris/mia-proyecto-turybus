
DELETE FROM transporte.estadisticas_uso;
DELETE FROM transporte.revisiones_reparaciones;
DELETE FROM transporte.billetes;
DELETE FROM transporte.lugares_recorrido;
DELETE FROM transporte.autobuses_conductores;
DELETE FROM seguridad.pasajeros;
DELETE FROM transporte.rutas_servicios;

DBCC CHECKIDENT ('transporte.estadisticas_uso', RESEED, 0);
DBCC CHECKIDENT ('transporte.revisiones_reparaciones', RESEED, 0);
DBCC CHECKIDENT ('transporte.billetes', RESEED, 0);
DBCC CHECKIDENT ('transporte.lugares_recorrido', RESEED, 0);
DBCC CHECKIDENT ('transporte.autobuses_conductores', RESEED, 0);
DBCC CHECKIDENT ('transporte.rutas_servicios', RESEED, 0);
