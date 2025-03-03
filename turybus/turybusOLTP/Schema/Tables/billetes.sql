-- Tabla de Billetes
create table transporte.billetes (
    id_billete INT PRIMARY KEY IDENTITY(1,1),
    dni_pasajero NVARCHAR(20) NOT NULL,
    id_ruta_servicio INT NOT NULL,
    fecha DATE NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    constraint fk_billetes_pasajeros FOREIGN KEY (dni_pasajero) REFERENCES seguridad.pasajeros(dni) ON DELETE CASCADE ON UPDATE CASCADE,
    constraint fk_billetes_rutas_servicios FOREIGN KEY (id_ruta_servicio) REFERENCES transporte.rutas_servicios(id_ruta_servicio) ON DELETE CASCADE ON UPDATE CASCADE
);