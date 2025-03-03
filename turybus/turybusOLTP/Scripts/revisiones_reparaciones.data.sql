PRINT 'Populating revisiones_reparaciones table';


INSERT INTO transporte.revisiones_reparaciones (matricula, fecha, diagnostico, codigo_reparacion, tiempo_empleado, comentario) VALUES
('ABC123', '2024-03-01', 'Cambio de aceite', 'R001', 30, 'Revisión periódica'),
('DEF456', '2024-03-02', 'Frenos desgastados', 'R002', 60, 'Sustitución de pastillas de freno');
