-- Tabla de Dimensión: Rutas
CREATE TABLE dwh.dim_rutas_servicios (
    id_ruta_servicio INT PRIMARY KEY,
    nombre NVARCHAR(255) NOT NULL,
    importe DECIMAL(10,2) NOT NULL
);