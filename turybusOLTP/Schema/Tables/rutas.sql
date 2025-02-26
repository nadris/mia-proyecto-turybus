CREATE TABLE transporte.rutas (
    id INT IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    importe DECIMAL(10,2) NOT NULL CHECK (importe >= 0),
    km_totales INT NOT NULL CHECK (km_totales > 0)
);
