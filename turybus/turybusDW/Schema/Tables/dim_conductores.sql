CREATE TABLE dwh.dim_conductores (
    dni_conductor NVARCHAR(20) UNIQUE NOT NULL PRIMARY KEY,
    nombre_conductor NVARCHAR(255) NOT NULL,
    telefono_conductor NVARCHAR(20) NOT NULL
);
