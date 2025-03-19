CREATE TABLE dwh.dim_autobuses (
    AutobusesSK int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    matricula NVARCHAR(20) NOT NULL,
    modelo NVARCHAR(255) NOT NULL,
    fabricante NVARCHAR(255) NOT NULL,
    num_plazas INT NOT NULL
);