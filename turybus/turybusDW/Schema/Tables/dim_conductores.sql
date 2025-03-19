CREATE TABLE dwh.dim_conductores (
    ConductoresSK int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    dni_conductor NVARCHAR(20) NOT NULL,
    nombre_conductor NVARCHAR(255) NOT NULL,
    telefono_conductor NVARCHAR(20) NOT NULL
);
