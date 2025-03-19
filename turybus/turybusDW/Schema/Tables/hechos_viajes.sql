CREATE TABLE dwh.hechos_viajes (
    HechosViajesSK int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    AutobusesSK int NULL,
    ConductoresSK int NULL,
    PasajerosSK int NULL,
    RutasServiciosSK int NULL,
    dni_pasajero NVARCHAR(20) NOT NULL,
    id_ruta_servicio INT NOT NULL,
    matricula NVARCHAR(20) NOT NULL,
    dni_conductor NVARCHAR(20) NOT NULL,

    CONSTRAINT fk_autobuses FOREIGN KEY (AutobusesSK) REFERENCES dwh.dim_autobuses(AutobusesSK),
    CONSTRAINT fk_conductores FOREIGN KEY (ConductoresSK) REFERENCES dwh.dim_conductores(ConductoresSK),
    CONSTRAINT fk_pasajeros FOREIGN KEY (PasajerosSK) REFERENCES dwh.dim_pasajeros(PasajerosSK),
    CONSTRAINT fk_rutas_servicios FOREIGN KEY (RutasServiciosSK) REFERENCES dwh.dim_rutas_servicios(RutasServiciosSK)


);