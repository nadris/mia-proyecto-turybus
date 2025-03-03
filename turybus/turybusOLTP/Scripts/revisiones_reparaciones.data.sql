PRINT 'Populating revisiones_reparaciones table';

INSERT INTO transporte.revisiones_reparaciones (matricula, fecha, diagnostico, codigo_reparacion, tiempo_empleado, comentario) VALUES
('ABC123', '2024-06-05', 'Cambio de aceite', 'REP001', 60, 'Sin anomalías'),
('DEF456', '2024-06-06', 'Cambio de frenos', 'REP002', 120, 'Reemplazo completo'),
('GHI789', '2024-06-07', 'Cambio de neumáticos', 'REP003', 90, 'Neumáticos delanteros'),
('JKL012', '2024-06-08', 'Revisión de motor', 'REP004', 180, 'Ajuste de válvulas'),
('MNO345', '2024-06-09', 'Cambio de batería', 'REP005', 45, 'Batería nueva instalada'),
('PQR678', '2024-06-10', 'Cambio de filtros', 'REP006', 60, 'Aire y combustible'),
('STU901', '2024-06-11', 'Cambio de luces', 'REP007', 30, 'Luces delanteras'),
('VWX234', '2024-06-12', 'Sistema de suspensión', 'REP008', 150, 'Reemplazo de amortiguadores'),
('YZA567', '2024-06-13', 'Cambio de dirección', 'REP009', 90, 'Alineación ajustada'),
('BCD890', '2024-06-14', 'Cambio de radiador', 'REP010', 120, 'Líquido refrigerante nuevo');
