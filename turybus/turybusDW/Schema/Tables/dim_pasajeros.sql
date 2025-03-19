-- Tabla de Dimensión: Pasajeros
CREATE TABLE dwh.dim_pasajeros (
    PasajerosSK int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    dni NVARCHAR(20) NOT NULL,
    nombre NVARCHAR(255) NOT NULL,
    telefono NVARCHAR(20) NOT NULL
);
