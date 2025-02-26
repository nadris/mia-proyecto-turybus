CREATE TABLE transporte.autobuses (
    matricula VARCHAR(20) PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    fabricante VARCHAR(50) NOT NULL,
    num_plazas INT NOT NULL,
    caracteristicas TEXT
);
