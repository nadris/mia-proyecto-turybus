CREATE TABLE dwh.dim_autobuses (
    matricula NVARCHAR(20) UNIQUE NOT NULL PRIMARY KEY,
    modelo NVARCHAR(255) NOT NULL,
    fabricante NVARCHAR(255) NOT NULL,
    num_plazas INT NOT NULL
);