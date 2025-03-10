-- Tabla de Dimensión: Pasajeros
CREATE TABLE dwh.dim_pasajeros (
    dni NVARCHAR(20) UNIQUE NOT NULL PRIMARY KEY,
    nombre NVARCHAR(255) NOT NULL,
    telefono NVARCHAR(20) NOT NULL
);
