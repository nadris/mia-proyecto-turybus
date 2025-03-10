/*
Plantilla de script posterior a la implementación							
--------------------------------------------------------------------------------------
 Este archivo contiene instrucciones de SQL que se anexarán al script de compilación.		
 Use la sintaxis de SQLCMD para incluir un archivo en el script posterior a la implementación.			
 Ejemplo:      :r .\miArchivo.sql								
 Use la sintaxis de SQLCMD para hacer referencia a una variable en el script posterior a la implementación.		
 Ejemplo:      :setvar TableName miTabla							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


:r .\clean.data.sql
:r .\autobuses_conductores.data.sql
:r .\revisiones_reparaciones.data.sql
:r .\rutas_servicios.data.sql
:r .\pasajeros.data.sql
:r .\billetes.data.sql
:r .\lugares_recorrido.data.sql
:r .\estadisticas_uso.data.sql