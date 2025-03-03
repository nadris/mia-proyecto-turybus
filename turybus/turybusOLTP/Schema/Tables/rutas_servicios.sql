create table transporte.rutas_servicios (
    id_ruta_servicio INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(255) NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    hora_salida TIME NOT NULL,
    hora_llegada TIME NOT NULL,
    dias_programados NVARCHAR(50) NOT NULL,
    constraint chk_importe CHECK (importe > 0)
);