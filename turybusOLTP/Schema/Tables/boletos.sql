CREATE TABLE transporte.boletos (
    id INT IDENTITY PRIMARY KEY,
    pasajero_ci VARCHAR(20) NOT NULL,
    viaje_id INT NOT NULL,
    importe DECIMAL(10,2) NOT NULL CHECK (importe >= 0),
    CONSTRAINT fk_boletos_pasajeros FOREIGN KEY (pasajero_ci) REFERENCES transporte.pasajeros(ci) ON DELETE CASCADE,
    CONSTRAINT fk_boletos_viajes FOREIGN KEY (viaje_id) REFERENCES transporte.viajes(id) ON DELETE CASCADE
);