PRINT 'Populating autobuses_conductores table';
SET NOCOUNT ON;

SET IDENTITY_INSERT transporte.autobuses_conductores ON;

INSERT INTO transporte.autobuses_conductores (matricula, modelo, fabricante, num_plazas, dni_conductor, nombre_conductor, telefono_conductor, direccion_conductor) VALUES
('ABC123', 'Volvo B12', 'Volvo', 50, '12345678A', 'Mario Herrera', '555-0201', 'Calle 1'),
('DEF456', 'Scania K310', 'Scania', 45, '23456789B', 'Ricardo Vega', '555-0202', 'Calle 2'),
('GHI789', 'Mercedes Sprinter', 'Mercedes', 20, '34567890C', 'Daniel Ponce', '555-0203', 'Calle 3'),
('JKL012', 'MAN Lions Coach', 'MAN', 55, '45678901D', 'Ernesto Campos', '555-0204', 'Calle 4'),
('MNO345', 'Irizar i6', 'Irizar', 48, '56789012E', 'Fernando López', '555-0205', 'Calle 5');


SET IDENTITY_INSERT transporte.autobuses_conductores OFF;
