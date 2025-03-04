-- Tabla de Dimensión: Tiempo
CREATE TABLE dwh.dim_tiempo (
    id_tiempo INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE NOT NULL,
    año INT NOT NULL,
    mes INT NOT NULL,
    dia INT NOT NULL,
    dia_semana NVARCHAR(20) NOT NULL
);