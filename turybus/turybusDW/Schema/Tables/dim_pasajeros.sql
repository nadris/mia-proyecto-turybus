-- Tabla de Dimensión: Pasajeros
CREATE TABLE dwh.dim_pasajeros (
    id_pasajero INT IDENTITY(1,1) PRIMARY KEY,
    dni NVARCHAR(20) UNIQUE NOT NULL,
    nombre NVARCHAR(255) NOT NULL,
    telefono NVARCHAR(20) NOT NULL
);
