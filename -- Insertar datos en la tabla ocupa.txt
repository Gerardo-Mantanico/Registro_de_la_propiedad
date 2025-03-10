-- Insertar datos en la tabla ocupacion
INSERT INTO `ocupacion` (`tipo`) VALUES
('Ingeniero'), ('Doctor'), ('Profesor'), ('Abogado'), ('Arquitecto'),
('Contador'), ('Enfermero'), ('Policía'), ('Bombero'), ('Electricista');

-- Insertar datos en la tabla estado_civi
INSERT INTO `estado_civi` (`tipo`) VALUES
('Soltero'), ('Casado'), ('Divorciado'), ('Viudo'), ('Unión Libre'),
('Separado'), ('Comprometido'), ('Anulado'), ('Conviviente'), ('Desconocido');

-- Insertar datos en la tabla sexo
INSERT INTO `sexo` (`tipo`) VALUES
('Masculino'), ('Femenino');

-- Insertar datos en la tabla departamento
INSERT INTO `departamento` (`nombre`) VALUES
('Guatemala'), ('Sacatepéquez'), ('Escuintla'), ('Quetzaltenango'), ('Petén'),
('Jutiapa'), ('Zacapa'), ('Chimaltenango'), ('Huehuetenango'), ('Alta Verapaz');

-- Insertar datos en la tabla municipio
INSERT INTO `municipio` (`nombre`, `municipio`) VALUES
('Guatemala', 1), ('Mixco', 1), ('Villa Nueva', 1), ('Antigua Guatemala', 2),
('Escuintla', 3), ('Coatepeque', 4), ('San Benito', 5), ('Jutiapa', 6),
('Zacapa', 7), ('Chimaltenango', 8);

-- Insertar datos en la tabla persona
INSERT INTO `persona` (`primer_nombre`, `segundo_nombre`, `tercer_nombre`, `primer_apellido`, `segundo_apellido`, `nit`, `ocupacion`, `estado_civi`, `sexo`, `correo`, `fecha_nacimiento`, `ubicacion_nacimiento`, `recidencia`, `telefono`) VALUES
('Juan', 'Carlos', 'José', 'Pérez', 'López', 1234567890123, 1, 1, 1, 'juan.perez@example.com', '1990-05-15', 1, 1, 55551234),
('María', 'Fernanda', NULL, 'García', 'Martínez', 9876543210123, 2, 2, 2, 'maria.garcia@example.com', '1985-08-22', 2, 2, 55552345),
('Carlos', NULL, NULL, 'Rodríguez', 'Hernández', 1231231231234, 3, 3, 1, 'carlos.rodriguez@example.com', '1978-11-10', 3, 3, 55553456),
('Ana', 'Sofía', 'Isabel', 'Méndez', 'Ortiz', 5555555555555, 4, 4, 2, 'ana.mendez@example.com', '1995-03-25', 4, 4, 55554567),
('Pedro', 'Antonio', NULL, 'Fernández', 'Castro', 6666666666666, 5, 5, 1, 'pedro.fernandez@example.com', '1982-07-12', 5, 5, 55555678),
('Laura', 'Beatriz', 'Elena', 'Ramírez', 'Gómez', 7777777777777, 6, 6, 2, 'laura.ramirez@example.com', '1999-12-30', 6, 6, 55556789),
('José', NULL, NULL, 'Díaz', 'Ruiz', 8888888888888, 7, 7, 1, 'jose.diaz@example.com', '1987-06-17', 7, 7, 55557890),
('Carmen', 'Rosa', NULL, 'Vásquez', 'Molina', 9999999999999, 8, 8, 2, 'carmen.vasquez@example.com', '1993-04-14', 8, 8, 55558901),
('Luis', 'Eduardo', NULL, 'Torres', 'Sánchez', 1111111111111, 9, 9, 1, 'luis.torres@example.com', '1980-09-05', 9, 9, 55559012),
('Elena', 'Patricia', NULL, 'Hernández', 'Ramírez', 2222222222222, 10, 10, 2, 'elena.hernandez@example.com', '1975-01-20', 10, 10, 55550123);

-- Insertar datos en la tabla dpi
INSERT INTO `dpi` (`cui`, `fecha_emision`, `fecha_expiracion`) VALUES
(1, '2020-01-01', '2030-01-01'),
(2, '2019-05-15', '2029-05-15'),
(3, '2021-07-20', '2031-07-20'),
(4, '2018-10-10', '2028-10-10'),
(5, '2017-12-05', '2027-12-05'),
(6, '2016-08-22', '2026-08-22'),
(7, '2015-03-30', '2025-03-30'),
(8, '2014-06-18', '2024-06-18'),
(9, '2013-11-25', '2023-11-25'),
(10, '2012-09-07', '2022-09-07');



-- Insertar datos en la tabla tipo_zona
INSERT INTO `tipo_zona` (`nombre`) VALUES
('Urbana'), ('Rural'), ('Residencial'), ('Comercial'), ('Industrial'),
('Mixta'), ('Agrícola'), ('Forestal'), ('Turística'), ('Protegida');

-- Insertar datos en la tabla jurisdiccion
INSERT INTO `jurisdiccion` (`id_tipo_zona`, `nombre`, `id_municipio`) VALUES
(1, 'Zona Centro', 1), (2, 'Zona Rural Norte', 2), (3, 'Residencial Este', 3),
(4, 'Comercial Oeste', 4), (5, 'Industrial Sur', 5), (6, 'Zona Mixta 1', 6),
(7, 'Área Agrícola', 7), (8, 'Bosque Protegido', 8), (9, 'Área Turística', 9),
(10, 'Reserva Natural', 10);

-- Insertar datos en la tabla tipo_libro
INSERT INTO `tipo_libro` (`simbolo`, `departamento`) VALUES
('A', 1), ('B', 2), ('C', 3), ('D', 4), ('E', 5), 
('F', 6), ('G', 7), ('H', 8), ('I', 9), ('J', 10);

-- Insertar datos en la tabla naturaleza
INSERT INTO `naturaleza` (`nombre`) VALUES
('Residencial'), ('Comercial'), ('Industrial'), ('Mixta'), ('Agrícola'),
('Forestal'), ('Turística'), ('Protegida'), ('Educativa'), ('Cultural');

-- Insertar datos en la tabla tipo_finca
INSERT INTO `tipo_finca` (`tipo`) VALUES
('Casa'), ('Edificio'), ('Terreno'), ('Hacienda'), ('Parcela'),
('Rancho'), ('Apartamento'), ('Bodega'), ('Centro Comercial'), ('Finca Mixta');

-- Insertar datos en la tabla tipo_edificacion
INSERT INTO `tipo_edificacion` (`tipo`) VALUES
('Unifamiliar'), ('Multifamiliar'), ('Comercial'), ('Industrial'), ('Mixta'),
('Agrícola'), ('Oficinas'), ('Rascacielos'), ('Condominio'), ('Edificio Público');

-- Insertar datos en la tabla finca
INSERT INTO `finca` (`tipo_libro`, `jurisdiccion`, `area`, `tipo_naturaleza`, `nombre`, `tipo_finca`, `edicacion`, `tipo_edificacion`) VALUES
(1, 1, 250.50, 1, 'Residencia La Pradera', 1, true, 1),
(2, 2, 500.75, 2, 'Centro Comercial Zona 10', 9, true, 3),
(3, 3, 120.00, 3, 'Edificio Torre Azul', 2, true, 2),
(4, 4, 300.25, 4, 'Terreno Las Verapaces', 3, false, NULL),
(5, 5, 700.40, 5, 'Hacienda San Miguel', 4, true, 5),
(6, 6, 50.00, 6, 'Apartamento Las Palmas', 7, true, 6),
(7, 7, 900.00, 7, 'Rancho El Escondido', 6, true, 7),
(8, 8, 1000.00, 8, 'Área Protegida Sierra Madre', 10, false, NULL),
(9, 9, 450.00, 9, 'Escuela Rural Monte Verde', 8, true, 9),
(10, 10, 200.00, 10, 'Museo Histórico Nacional', 10, true, 10);



-- Insertar datos en la tabla derecho_propiedad
INSERT INTO `derecho_propiedad` (`nombre`, `descripcion`) VALUES
('Propiedad Plena', 'Derecho absoluto sobre el inmueble'),
('Usufructo', 'Derecho a usar y disfrutar un inmueble sin ser propietario'),
('Nuda Propiedad', 'Derecho de propiedad sin usufructo'),
('Copropiedad', 'Propiedad compartida entre varias personas'),
('Propiedad Horizontal', 'Derecho sobre un bien en un edificio dividido en unidades'),
('Herencia', 'Derecho sobre un inmueble adquirido por sucesión'),
('Cesión de Derechos', 'Transferencia de derechos sobre un inmueble'),
('Derecho de Superficie', 'Uso del suelo ajeno para edificar'),
('Arrendamiento con Opción a Compra', 'Uso del inmueble con derecho a compra futura'),
('Hipoteca', 'Garantía real sobre el inmueble para asegurar una deuda');

-- Insertar datos en la tabla moneda
INSERT INTO `moneda` (`nombre`, `simbolo`) VALUES
('Quetzal', 'Q'),
('Dólar', '$'),
('Euro', '€'),
('Libra Esterlina', '£'),
('Yen Japonés', '¥'),
('Peso Mexicano', '$'),
('Real Brasileño', 'R$'),
('Peso Argentino', '$'),
('Rublo Ruso', '₽'),
('Franco Suizo', 'CHF');

-- Insertar datos en la tabla compra_venta
INSERT INTO `compra_venta` (`moneda`, `valor_inmueble`, `observaciones`, `colegiado`) VALUES
(1, 500000.00, 'Venta de casa en zona residencial', 1),
(2, 250000.50, 'Compra de terreno para construcción', 2),
(3, 750000.75, 'Adquisición de edificio comercial', 3),
(4, 100000.00, 'Venta de apartamento en condominio', 4),
(5, 95000.25, 'Compra de finca agrícola', 5),
(6, 120000.00, 'Inversión en propiedad industrial', 6),
(7, 300000.40, 'Compra de rancho turístico', 7),
(8, 650000.00, 'Venta de bodega en área comercial', 8),
(9, 80000.00, 'Compra de casa en zona rural', 9),
(10, 450000.00, 'Venta de oficinas en centro financiero', 10);

-- Insertar datos en la tabla desmembraciones
INSERT INTO `desmembraciones` (`colegiado`, `representante`, `id_finca_matriz`, `id_finca_nueva`, `fecha_desmembracion`, `observaciones`) VALUES
(1, 2, 10, 11, '2024-01-15', 'Desmembración de terreno en dos lotes'),
(2, 3, 11, 12, '2024-02-20', 'Fraccionamiento para urbanización'),
(3, 4, 12, 13, '2024-03-25', 'Segregación para venta individual'),
(4, 5, 13, 14, '2024-04-30', 'División de propiedad en varias partes'),
(5, 6, 14, 15, '2024-05-10', 'Reducción de extensión de finca original'),
(6, 7, 15, 16, '2024-06-05', 'Desmembración para construcción'),
(7, 8, 16, 17, '2024-07-12', 'Separación para inversión comercial'),
(8, 9, 17, 18, '2024-08-18', 'Repartición entre herederos'),
(9, 10, 18, 19, '2024-09-23', 'Urbanización de predios'),
(10, 1, 19, 20, '2024-10-29', 'Fraccionamiento para venta');

-- Insertar datos en la tabla estado_colegiado
INSERT INTO `estado_colegiado` (`estado`) VALUES
('Activo'), ('Inactivo'), ('Suspendido'), ('Retirado'),
('En trámite'), ('Rechazado'), ('Condicionado'), ('En revisión'),
('Expulsado'), ('Fallecido');

-- Insertar datos en la tabla categoria_colegiado
INSERT INTO `categoria_colegiado` (`categoria`) VALUES
('Notario Público'), ('Abogado'), ('Registrador'), ('Topógrafo'),
('Arquitecto'), ('Ingeniero Civil'), ('Urbanista'), ('Perito Valuador'),
('Geógrafo'), ('Administrador de Bienes');

-- Insertar datos en la tabla especialidad_colegiado
INSERT INTO `especialidad_colegiado` (`tipo`) VALUES
('Derecho Civil'), ('Derecho Notarial'), ('Derecho Registral'), ('Urbanismo'),
('Catastro'), ('Valuación de Bienes'), ('Construcción y Edificación'),
('Propiedad Intelectual'), ('Ordenamiento Territorial'), ('Derecho Mercantil');

-- Insertar datos en la tabla colegiado
INSERT INTO `colegiado` (`id_persona`, `dpi`, `estado_colegiado`, `categoria`, `especialidad`, `fecha_expiracion`, `fecha_emision`) VALUES
(1, 100001, 1, 1, 1, '2027-12-31', '2023-01-01'),
(2, 100002, 2, 2, 2, '2026-11-30', '2022-02-15'),
(3, 100003, 3, 3, 3, '2025-10-29', '2021-03-20'),
(4, 100004, 4, 4, 4, '2028-09-25', '2024-04-10'),
(5, 100005, 5, 5, 5, '2029-08-18', '2025-05-05'),
(6, 100006, 6, 6, 6, '2030-07-12', '2026-06-08'),
(7, 100007, 7, 7, 7, '2031-06-05', '2027-07-01'),
(8, 100008, 8, 8, 8, '2032-05-20', '2028-08-09'),
(9, 100009, 9, 9, 9, '2033-04-15', '2029-09-22'),
(10, 100010, 10, 10, 10, '2034-03-10', '2030-10-30');


-- Insertar datos en la tabla unificacion
INSERT INTO `unificacion` (`colegiado`, `representante`, `id_finca_nueva`, `area`, `fecha`, `observaciones`) VALUES
(1, 2, 11, 5000.00, '2024-01-10', 'Unificación de terrenos agrícolas'),
(2, 3, 12, 7500.50, '2024-02-15', 'Fusión de terrenos para urbanización'),
(3, 4, 13, 12000.00, '2024-03-20', 'Unificación para construcción de complejo'),
(4, 5, 14, 6800.75, '2024-04-25', 'Unión de propiedades comerciales'),
(5, 6, 15, 8200.25, '2024-05-30', 'Integración de terrenos para parque industrial'),
(6, 7, 16, 9500.80, '2024-06-10', 'Fusión de terrenos privados'),
(7, 8, 17, 10450.00, '2024-07-15', 'Ampliación de propiedad con terreno adyacente'),
(8, 9, 18, 8900.60, '2024-08-20', 'Unificación de terrenos en área de reserva'),
(9, 10, 19, 7200.30, '2024-09-25', 'Integración de parcelas para desarrollo inmobiliario'),
(10, 1, 20, 10000.00, '2024-10-30', 'Unificación para proyecto de inversión');

-- Insertar datos en la tabla unificacion_fincas
INSERT INTO `unificacion_fincas` (`id_unificacion`, `id_fincas`) VALUES
(1, 5), (1, 6), (2, 7), (2, 8), (3, 9), (3, 10), 
(4, 11), (4, 12), (5, 13), (5, 14);

-- Insertar datos en la tabla tipo_gravamenes_licitaciones
INSERT INTO `tipo_gravamenes_licitaciones` (`tipo`) VALUES
('Hipoteca'), ('Embargo'), ('Usufructo'), ('Arrendamiento'),
('Censo'), ('Derecho de Retención'), ('Prohibición de Venta'),
('Garantía Prendaria'), ('Derecho de Superficie'), ('Carga Fiscal');

-- Insertar datos en la tabla gravamenes_licitaciones
INSERT INTO `gravamenes_licitaciones` (`id_unificacion`, `tipo_gravamenes_licitaciones`) VALUES
(1, 2), (1, 4), (2, 5), (2, 7), (3, 1), (3, 6), 
(4, 3), (4, 8), (5, 9), (5, 10);

-- Insertar datos en la tabla titulacion_supletoria
INSERT INTO `titulacion_supletoria` (`juez_compotente`, `colegiado`, `id_finca`, `fecha`) VALUES
(1, 2, 10, '2024-01-05'),
(2, 3, 11, '2024-02-10'),
(3, 4, 12, '2024-03-15'),
(4, 5, 13, '2024-04-20'),
(5, 6, 14, '2024-05-25'),
(6, 7, 15, '2024-06-30'),
(7, 8, 16, '2024-07-05'),
(8, 9, 17, '2024-08-10'),
(9, 10, 18, '2024-09-15'),
(10, 1, 19, '2024-10-20');

-- Insertar datos en la tabla propietarios
INSERT INTO `propietarios` (`persona`, `titulacion_supletoria`) VALUES
(1, 3), (2, 4), (3, 5), (4, 6), (5, 7), (6, 8), (7, 9), (8, 10), (9, 1), (10, 2);

-- Insertar datos en la tabla punto_cardinalidad
INSERT INTO `punto_cardinalidad` (`descripcion`) VALUES
('Norte'), ('Sur'), ('Este'), ('Oeste'),
('Noreste'), ('Noroeste'), ('Sureste'), ('Suroeste'),
('Centro'), ('Indeterminado');

-- Insertar datos en la tabla colidante
INSERT INTO `colidante` (`id_inmueble`, `punto_cardinal`) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

-- Insertar datos en la tabla coordenadas
INSERT INTO `coordenadas` (`id_inmueble`, `longitud`, `latitud`) VALUES
(1, -90.5123, 14.6349), (2, -90.5134, 14.6350), (3, -90.5145, 14.6351),
(4, -90.5156, 14.6352), (5, -90.5167, 14.6353), (6, -90.5178, 14.6354),
(7, -90.5189, 14.6355), (8, -90.5190, 14.6356), (9, -90.5201, 14.6357), (10, -90.5212, 14.6358);

-- Insertar datos en la tabla testigo
INSERT INTO `testigo` (`titulacion_supletoria`, `id_colindante`) VALUES
(1, 2), (2, 3), (3, 4), (4, 5), (5, 6),
(6, 7), (7, 8), (8, 9), (9, 10), (10, 1);

-- Insertar datos en la tabla orden_defuncion
INSERT INTO `orden_defuncion` (`id_persona`, `causa`, `lugar_fallecimiento`, `fecha_hora`) VALUES
(1, 'Infarto', 2, '2024-01-10 08:30:00'),
(2, 'Accidente', 3, '2024-02-15 12:45:00'),
(3, 'Cáncer', 4, '2024-03-20 14:20:00'),
(4, 'Neumonía', 5, '2024-04-25 16:10:00'),
(5, 'Covid-19', 6, '2024-05-30 18:50:00'),
(6, 'Paro respiratorio', 7, '2024-06-10 21:00:00'),
(7, 'Accidente cerebrovascular', 8, '2024-07-15 09:30:00'),
(8, 'Insuficiencia renal', 9, '2024-08-20 11:10:00'),
(9, 'Diabetes', 10, '2024-09-25 13:40:00'),
(10, 'Enfermedad hepática', 1, '2024-10-30 15:25:00');

-- Insertar datos en la tabla testamento_hereditario
INSERT INTO `testamento_hereditario` (`orden_defucion`, `colegiado`, `representante_legal`, `fecha_ingreso`) VALUES
(1, 3, 5, '2024-01-15'),
(2, 4, 6, '2024-02-20'),
(3, 5, 7, '2024-03-25'),
(4, 6, 8, '2024-04-30'),
(5, 7, 9, '2024-05-05'),
(6, 8, 10, '2024-06-10'),
(7, 9, 1, '2024-07-15'),
(8, 10, 2, '2024-08-20'),
(9, 1, 3, '2024-09-25'),
(10, 2, 4, '2024-10-30');

-- Insertar datos en la tabla herederos
INSERT INTO `herederos` (`id_persona`, `id_testamento_hereditario`) VALUES
(1, 3), (2, 4), (3, 5), (4, 6), (5, 7),
(6, 8), (7, 9), (8, 10), (9, 1), (10, 2);

-- Insertar datos en la tabla hereditario_intestado
INSERT INTO `hereditario_intestado` (`orden_defucion`, `colegiado`, `representante_legal`, `fecha_ingreso`) VALUES
(1, 2, 3, '2024-01-12'),
(2, 3, 4, '2024-02-17'),
(3, 4, 5, '2024-03-22'),
(4, 5, 6, '2024-04-27'),
(5, 6, 7, '2024-05-02'),
(6, 7, 8, '2024-06-07'),
(7, 8, 9, '2024-07-12'),
(8, 9, 10, '2024-08-17'),
(9, 10, 1, '2024-09-22'),
(10, 1, 2, '2024-10-27');

-- Insertar datos en la tabla anotaciones
INSERT INTO `anotaciones` (`finca_id`, `texto`, `fecha`) VALUES
(1, 'Anotación sobre el estado legal de la finca.', '2024-01-10'),
(2, 'Documento en proceso de validación.', '2024-02-15'),
(3, 'Pendiente de aprobación por el notario.', '2024-03-20'),
(4, 'Propiedad en disputa legal.', '2024-04-25'),
(5, 'Aprobada la nueva inscripción.', '2024-05-30'),
(6, 'Modificación en el título de propiedad.', '2024-06-10'),
(7, 'Propiedad lista para venta.', '2024-07-15'),
(8, 'Revisión de los límites de la finca.', '2024-08-20'),
(9, 'Nueva hipoteca agregada.', '2024-09-25'),
(10, 'Finca liberada de gravámenes.', '2024-10-30');

-- Insertar datos en la tabla banco
INSERT INTO `banco` (`nombre`, `codigo`, `direccion`, `telefono`, `correo`) VALUES
('Banco Nacional', 1001, 'Avenida Central #123', 22223344, 'contacto@banco1.com'),
('Banco Popular', 1002, 'Calle Reforma #234', 22334455, 'info@banco2.com'),
('Banco de América', 1003, 'Boulevard Principal #456', 22445566, 'servicio@banco3.com'),
('Banco Industrial', 1004, 'Zona Financiera #567', 22556677, 'bancoid@banco4.com'),
('Banco Agrícola', 1005, 'Plaza Comercial #678', 22667788, 'agricola@banco5.com'),
('Banco Metropolitano', 1006, 'Centro Empresarial #789', 22778899, 'metro@banco6.com'),
('Banco Rural', 1007, 'Carretera Interamericana #890', 22889900, 'rural@banco7.com'),
('Banco del Sur', 1008, 'Avenida Independencia #901', 22990011, 'sur@banco8.com'),
('Banco Capital', 1009, 'Zona Financiera #111', 23001122, 'capital@banco9.com'),
('Banco Universal', 1010, 'Paseo de la Reforma #222', 23112233, 'universal@banco10.com');

-- Insertar datos en la tabla periodo
INSERT INTO `periodo` (`periodo`) VALUES
('Mensual'), ('Bimestral'), ('Trimestral'), ('Cuatrimestral'),
('Semestral'), ('Anual'), ('Bienal'), ('Trienal'),
('Quinquenal'), ('Decenal');

-- Insertar datos en la tabla credito
INSERT INTO `credito` (`tipo`) VALUES
('Hipotecario'), ('Personal'), ('Automotriz'), ('Educativo'),
('Comercial'), ('Microcrédito'), ('Agropecuario'), ('Consumo'),
('Inversión'), ('Reestructuración');

-- Insertar datos en la tabla hipotecas
INSERT INTO `hipotecas` (`representante_legal`, `tipo_credio`, `porcentaje`, `banco`, `fecha_emision`, `fecha_expiracion`, `id_finca`, `colegiado`, `periodo`) VALUES
(1, 1, 20, 1, '2024-01-01', '2034-01-01', 1, 3, 6),
(2, 2, 15, 2, '2024-02-05', '2034-02-05', 2, 4, 5),
(3, 3, 30, 3, '2024-03-10', '2034-03-10', 3, 5, 4),
(4, 4, 10, 4, '2024-04-15', '2034-04-15', 4, 6, 3),
(5, 5, 25, 5, '2024-05-20', '2034-05-20', 5, 7, 2),
(6, 6, 35, 6, '2024-06-25', '2034-06-25', 6, 8, 1),
(7, 7, 18, 7, '2024-07-30', '2034-07-30', 7, 9, 8),
(8, 8, 40, 8, '2024-08-05', '2034-08-05', 8, 10, 7),
(9, 9, 12, 9, '2024-09-10', '2034-09-10', 9, 1, 9),
(10, 10, 50, 10, '2024-10-15', '2034-10-15', 10, 2, 10);

-- Insertar datos en la tabla propiedad_horizontal
INSERT INTO `propiedad_horizontal` (`finca_id`, `descripcion`, `fecha`) VALUES
(1, 'Edificio de 5 niveles con 10 apartamentos.', '2024-01-10'),
(2, 'Conjunto residencial de 20 casas.', '2024-02-15'),
(3, 'Centro comercial de 50 locales.', '2024-03-20'),
(4, 'Torre de oficinas con 15 niveles.', '2024-04-25'),
(5, 'Proyecto habitacional con 30 apartamentos.', '2024-05-30'),
(6, 'Residencial con casas de 2 pisos.', '2024-06-10'),
(7, 'Condominio con área verde común.', '2024-07-15'),
(8, 'Edificio con oficinas y área comercial.', '2024-08-20'),
(9, 'Urbanización con parque privado.', '2024-09-25'),
(10, 'Complejo de apartamentos de lujo.', '2024-10-30');

-- Insertar datos en la tabla amenidades
INSERT INTO `amenidades` (`tipo`) VALUES
('Piscina'), ('Gimnasio'), ('Salón de eventos'), ('Áreas verdes'),
('Parqueo techado'), ('Seguridad 24/7'), ('Juegos infantiles'),
('Pista para correr'), ('Área de coworking'), ('Cine privado');

-- Insertar datos en la tabla donaciones
INSERT INTO `donaciones` (`colegiado`, `representante_legal`, `mensaje__aceptacion`, `id_finca_donada`, `fecha_donacion`) VALUES
(1, 2, 'Donación aceptada por el beneficiario.', 1, '2024-01-10'),
(2, 3, 'Finca donada a organización sin fines de lucro.', 2, '2024-02-15'),
(3, 4, 'Propiedad entregada con fines educativos.', 3, '2024-03-20'),
(4, 5, 'Donación realizada en memoria de un familiar.', 4, '2024-04-25'),
(5, 6, 'Se otorga la finca para conservación ambiental.', 5, '2024-05-30'),
(6, 7, 'Beneficiario acepta la donación con gratitud.', 6, '2024-06-10'),
(7, 8, 'Se cede la finca para proyecto comunitario.', 7, '2024-07-15'),
(8, 9, 'Donación aprobada para entidad gubernamental.', 8, '2024-08-20'),
(9, 10, 'Entidad religiosa recibe la propiedad.', 9, '2024-09-25'),
(10, 1, 'Finca otorgada para actividades deportivas.', 10, '2024-10-30');

-- Insertar datos en la tabla permutas
INSERT INTO `permutas` (`colegiado`, `representante_legal`, `finca_id`, `fecha`) VALUES
(1, 2, 1, '2024-01-12'),
(2, 3, 2, '2024-02-14'),
(3, 4, 3, '2024-03-16'),
(4, 5, 4, '2024-04-18'),
(5, 6, 5, '2024-05-20'),
(6, 7, 6, '2024-06-22'),
(7, 8, 7, '2024-07-24'),
(8, 9, 8, '2024-08-26'),
(9, 10, 9, '2024-09-28'),
(10, 1, 10, '2024-10-30');

-- Insertar datos en la tabla adjudicacion
INSERT INTO `adjudicacion` (`colegiado`, `representante_legal`, `finca_id`, `fecha`) VALUES
(1, 2, 1, '2024-01-05'),
(2, 3, 2, '2024-02-10'),
(3, 4, 3, '2024-03-15'),
(4, 5, 4, '2024-04-20'),
(5, 6, 5, '2024-05-25'),
(6, 7, 6, '2024-06-30'),
(7, 8, 7, '2024-07-05'),
(8, 9, 8, '2024-08-10'),
(9, 10, 9, '2024-09-15'),
(10, 1, 10, '2024-10-20');

-- Insertar datos en la tabla socios
INSERT INTO `socios` (`id_adjudicacion`, `socios`, `porcentaje`) VALUES
(1, 3, 50),
(2, 4, 40),
(3, 5, 30),
(4, 6, 60),
(5, 7, 20),
(6, 8, 70),
(7, 9, 80),
(8, 10, 90),
(9, 1, 10),
(10, 2, 100);

-- Insertar datos en la tabla desmembracion
INSERT INTO `desmembracion` (`colegiado`, `representante_legal`, `finca_id_desmembrar`, `finca_id_nueva`, `fecha`) VALUES
(1, 2, 1, 11, '2024-01-10'),
(2, 3, 2, 12, '2024-02-15'),
(3, 4, 3, 13, '2024-03-20'),
(4, 5, 4, 14, '2024-04-25'),
(5, 6, 5, 15, '2024-05-30'),
(6, 7, 6, 16, '2024-06-10'),
(7, 8, 7, 17, '2024-07-15'),
(8, 9, 8, 18, '2024-08-20'),
(9, 10, 9, 19, '2024-09-25'),
(10, 1, 10, 20, '2024-10-30');

-- Insertar datos en la tabla duplicado
INSERT INTO `duplicado` (`finca_id`) VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

-- Insertar datos en la tabla tipos_servidumbre
INSERT INTO `tipos_servidumbre` (`tipo`) VALUES
('Paso vehicular'), ('Paso peatonal'), ('Servidumbre de agua'), 
('Servidumbre de vista'), ('Derecho de luz'), ('Paso de ganado'), 
('Tendido eléctrico'), ('Paso de tuberías'), ('Acceso a río'), ('Acceso a playa');

-- Insertar datos en la tabla servidumbres
INSERT INTO `servidumbres` (`tipo_servidumbre`, `finca_id`) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);



