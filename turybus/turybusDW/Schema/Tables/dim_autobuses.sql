CREATE TABLE dwh.dim_autobuses (
    id_autobus INT IDENTITY(1,1) PRIMARY KEY,
    matricula NVARCHAR(20) UNIQUE NOT NULL,
    modelo NVARCHAR(255) NOT NULL,
    fabricante NVARCHAR(255) NOT NULL,
    num_plazas INT NOT NULL
);