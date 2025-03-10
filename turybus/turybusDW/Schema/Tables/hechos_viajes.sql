CREATE TABLE dwh.hechos_viajes (
    dni_pasajero NVARCHAR(20) NOT NULL,
    id_ruta_servicio INT NOT NULL,
    matricula NVARCHAR(20) NOT NULL,
    dni_conductor NVARCHAR(20) NOT NULL,

    CONSTRAINT fk_hechos_viajes_pasajeros FOREIGN KEY (dni_pasajero) REFERENCES dwh.dim_pasajeros(dni),
    CONSTRAINT fk_hechos_viajes_rutas_servicios FOREIGN KEY (id_ruta_servicio) REFERENCES dwh.dim_rutas_servicios(id_ruta_servicio),
    CONSTRAINT fk_hechos_viajes_autobuses FOREIGN KEY (matricula) REFERENCES dwh.dim_autobuses(matricula),
    CONSTRAINT fk_hechos_viajes_conductores FOREIGN KEY (dni_conductor) REFERENCES dwh.dim_conductores(dni_conductor)

);