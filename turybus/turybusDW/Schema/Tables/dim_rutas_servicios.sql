-- Tabla de Dimensión: Rutas
CREATE TABLE dwh.dim_rutas_servicios (
    RutasServiciosSK int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    id_ruta_servicio INT NOT NULL,
    nombre NVARCHAR(255) NOT NULL,
    importe DECIMAL(10,2) NOT NULL
);