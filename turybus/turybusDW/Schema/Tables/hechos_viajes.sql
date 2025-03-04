CREATE TABLE dwh.hechos_viajes (
    id_viaje INT IDENTITY(1,1) PRIMARY KEY,
    id_pasajero INT NOT NULL,
    id_ruta INT NOT NULL,
    id_tiempo INT NOT NULL,
    id_autobus INT NOT NULL,
    id_conductor INT NOT NULL,
    km_recorridos DECIMAL(10,2) NOT NULL,
    horas_viaje DECIMAL(10,2) NOT NULL,
    importe DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_hechos_pasajeros FOREIGN KEY (id_pasajero) REFERENCES dwh.dim_pasajeros(id_pasajero),
    CONSTRAINT fk_hechos_rutas FOREIGN KEY (id_ruta) REFERENCES dwh.dim_rutas(id_ruta),
    CONSTRAINT fk_hechos_tiempo FOREIGN KEY (id_tiempo) REFERENCES dwh.dim_tiempo(id_tiempo),
    CONSTRAINT fk_hechos_autobuses FOREIGN KEY (id_autobus) REFERENCES dwh.dim_autobuses(id_autobus),
    CONSTRAINT fk_hechos_conductores FOREIGN KEY (id_conductor) REFERENCES dwh.dim_conductores(id_conductor)
);