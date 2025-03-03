PRINT 'Populating autobuses_conductores table';

INSERT INTO transporte.autobuses_conductores (matricula, modelo, fabricante, num_plazas, dni_conductor, nombre_conductor, telefono_conductor, direccion_conductor) VALUES
('ABC123', 'Volvo 9700', 'Volvo', 50, '11111111A', 'Pedro Martinez', '555-2222', 'Calle Falsa 123'),
('DEF456', 'Mercedes Tourismo', 'Mercedes-Benz', 45, '22222222B', 'Jorge Gonzalez', '555-3333', 'Avenida Central 456'),
('GHI789', 'Scania Irizar', 'Scania', 55, '33333333C', 'Rafael Suarez', '555-4444', 'Paseo de la Reforma 789'),
('JKL012', 'MAN Lion’s Coach', 'MAN', 40, '44444444D', 'Esteban Morales', '555-5555', 'Plaza Mayor 101'),
('MNO345', 'Setra TopClass', 'Setra', 60, '55555555E', 'Fernando Lopez', '555-6666', 'Boulevard Norte 202'),
('PQR678', 'Irizar i6', 'Irizar', 50, '66666666F', 'Carlos Rodríguez', '555-7777', 'Avenida del Sol 303'),
('STU901', 'Neoplan Skyliner', 'Neoplan', 70, '77777777G', 'Luis Gutierrez', '555-8888', 'Paseo Marítimo 404'),
('VWX234', 'Marcopolo Paradiso', 'Marcopolo', 65, '88888888H', 'Juan Morales', '555-9999', 'Calle del Río 505'),
('YZA567', 'Volvo B11R', 'Volvo', 50, '99999999I', 'José Sánchez', '555-0000', 'Avenida Universidad 606'),
('BCD890', 'Mercedes Sprinter', 'Mercedes-Benz', 30, '10101010J', 'Antonio Vargas', '555-1212', 'Calle de los Olivos 707');
