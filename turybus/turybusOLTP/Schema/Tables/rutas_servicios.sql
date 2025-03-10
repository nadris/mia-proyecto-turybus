-- Tabla de Rutas y Servicios Diarios combinados
create table transporte.rutas_servicios (
    id_ruta_servicio INT PRIMARY KEY IDENTITY(1,1),
    id_asignacion INT NOT NULL,
    nombre NVARCHAR(255) NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    hora_salida TIME NOT NULL,
    hora_llegada TIME NOT NULL,
    dias_programados NVARCHAR(50) NOT NULL,
    rowversion  timestamp         NOT NULL,
    constraint chk_importe CHECK (importe > 0),
    constraint fk_id_asignacion foreign key (id_asignacion) references transporte.autobuses_conductores(id_asignacion)
);