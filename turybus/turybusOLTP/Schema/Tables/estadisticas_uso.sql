-- Tabla de Estadísticas de Uso
create table transporte.estadisticas_uso (
    id_estadistica INT PRIMARY KEY IDENTITY(1,1),
    id_ruta_servicio INT NOT NULL,
    dni_pasajero NVARCHAR(20),
    km_recorridos DECIMAL(10,2) NOT NULL,
    horas_viaje DECIMAL(10,2) NOT NULL,
    rowversion  timestamp         NOT NULL,
    constraint fk_estadisticas_uso_rutas_servicios FOREIGN KEY (id_ruta_servicio) REFERENCES transporte.rutas_servicios(id_ruta_servicio) ON DELETE CASCADE ON UPDATE CASCADE,
    constraint fk_estadisticas_uso_pasajeros FOREIGN KEY (dni_pasajero) REFERENCES seguridad.pasajeros(dni) ON DELETE CASCADE ON UPDATE CASCADE
);
