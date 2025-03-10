CREATE TABLE `ocupacion` (
  `id` serial PRIMARY KEY,
  `tipo` varchar(100)
);

CREATE TABLE `estado_civi` (
  `id` serial PRIMARY KEY,
  `tipo` varchar(50)
);

CREATE TABLE `sexo` (
  `id` serial PRIMARY KEY,
  `tipo` varchar(25)
);

CREATE TABLE `persona` (
  `cui` serial PRIMARY KEY,
  `primer_nombre` varchar(72),
  `segundo_nombre` varchar(73),
  `tercer_nombre` varchar(72),
  `primer_apellido` varchar(72),
  `segundo_apellido` varchar(72),
  `nit` int(13),
  `ocupacion` int,
  `estado_civi` int,
  `sexo` int,
  `correo` varchar(250),
  `fecha_nacimiento` date,
  `ubicacion_nacimiento` int,
  `recidencia` int,
  `telefono` int(8)
);

CREATE TABLE `dpi` (
  `numero_serie` serial PRIMARY KEY,
  `cui` bigint,
  `fecha_emision` date,
  `fecha_expiracion` date
);

CREATE TABLE `departamento` (
  `id` serial PRIMARY KEY,
  `nombre` varchar(100)
);

CREATE TABLE `municipio` (
  `id` serial PRIMARY KEY,
  `nombre` varchar(100),
  `municipio` bigint
);

CREATE TABLE `tipo_zona` (
  `id` serial PRIMARY KEY,
  `nombre` varchar(120)
);

CREATE TABLE `jurisdiccion` (
  `id` Serial PRIMARY KEY,
  `id_tipo_zona` bigint,
  `nombre` varchar(72),
  `id_municipio` bigint
);

CREATE TABLE `tipo_libro` (
  `id` serial PRIMARY KEY,
  `serie` serial,
  `simbolo` varchar(1),
  `departamento` bigint
);

CREATE TABLE `naturaleza` (
  `id` serial PRIMARY KEY,
  `nombre` varchar(72)
);

CREATE TABLE `tipo_finca` (
  `id` serial PRIMARY KEY,
  `tipo` varchar(25)
);

CREATE TABLE `tipo_edificacion` (
  `id` serial PRIMARY KEY,
  `tipo` varchar(45)
);

CREATE TABLE `finca` (
  `id` serial PRIMARY KEY,
  `folio` serial,
  `tipo_libro` bigint,
  `jurisdiccion` bigint,
  `area` decimal(10,2),
  `tipo_naturaleza` bigint,
  `nombre` varchar(72),
  `tipo_finca` bigint,
  `edicacion` boolean,
  `tipo_edificacion` bigint
);

CREATE TABLE `derecho_propiedad` (
  `id` Serial PRIMARY KEY,
  `nombre` varchar(250),
  `descripcion` text
);

CREATE TABLE `moneda` (
  `id` serial PRIMARY KEY,
  `nombre` varchar(72),
  `simbolo` char(1)
);

CREATE TABLE `compra_venta` (
  `id` Serial PRIMARY KEY,
  `moneda` bigint,
  `valor_inmueble` decimal(10.2),
  `id_finca` bigint,
  `observaciones` text,
  `colegiado` bigint
);

CREATE TABLE `desmembraciones` (
  `id` SERIAL PRIMARY KEY,
  `colegiado` bigint,
  `representante` bigint,
  `id_finca_matriz` bigint,
  `id_finca_nueva` bigint,
  `fecha_desmembracion` DATE,
  `observaciones ` text
);

CREATE TABLE `estado_colegiado` (
  `id` serial PRIMARY KEY,
  `estado` varchar(35)
);

CREATE TABLE `categoria_colegiado` (
  `id` serial PRIMARY KEY,
  `categoria` varchar(35)
);

CREATE TABLE `especialidad_colegiado` (
  `id` serial PRIMARY KEY,
  `tipo` varchar(35)
);

CREATE TABLE `colegiado` (
  `id` serial PRIMARY KEY,
  `id_persona` bigint,
  `dpi` bigint,
  `estado_colegiado` bigint,
  `categoria` bigint,
  `especialidad` bigint,
  `fecha_expiracion` date,
  `fecha_emision` date
);

CREATE TABLE `unificacion` (
  `id` SERIAL PRIMARY KEY,
  `colegiado` bigint,
  `representante` bigint,
  `id_finca_nueva` bigint,
  `area` decimal(10,2),
  `fecha` DATE,
  `observaciones` TEXT
);

CREATE TABLE `unificacion_fincas` (
  `id_unificacion` bigint,
  `id_fincas` bigint
);

CREATE TABLE `tipo_gravamenes_licitaciones` (
  `id` serial PRIMARY KEY,
  `tipo` varchar(72)
);

CREATE TABLE `gravamenes_licitaciones` (
  `id` serial PRIMARY KEY,
  `id_unificacion` bigint,
  `tipo_gravamenes_licitaciones` bigint
  `id_finca` biginit
);

CREATE TABLE `titulacion_supletoria` (
  `id` SERIAL PRIMARY KEY,
  `juez_compotente` bigint,
  `colegiado` bigint,
  `id_finca` bigint,
  `fecha` DATE
);

CREATE TABLE `propietarios` (
  `id` SERIAL PRIMARY KEY,
  `persona` bigint,
  `titulacion_supletoria` bigint
);

CREATE TABLE `punto_cardinalidad` (
  `id` serila PRIMARY KEY,
  `descripcion` varchar(25)
);

CREATE TABLE `colidante` (
  `id` serial PRIMARY KEY,
  `id_inmueble` bigint,
  `punto_cardinal` bigint
);

CREATE TABLE `coordenadas` (
  `id` serial PRIMARY KEY,
  `id_inmueble` bigint,
  `longitud` decimal(10,2),
  `latitud` decimal(10,2)
);

CREATE TABLE `testigo` (
  `id` SERIAL PRIMARY KEY,
  `titulacion_supletoria` bigint,
  `id_colindante` bigint
);

CREATE TABLE `orden_defuncion` (
  `id` serial PRIMARY KEY,
  `id_persona` bigint,
  `causa` text,
  `lugar_fallecimiento` bigint,
  `fecha_hora` datetime
);

CREATE TABLE `testamento_hereditario` (
  `id` SERIAL PRIMARY KEY,
  `orden_defucion` bigint,
  `colegiado` bigint,
  `representante_legal` bigint,
  `fecha_ingreso` DATE
);

CREATE TABLE `herederos` (
  `id` serial PRIMARY KEY,
  `id_persona` bigint,
  `id_testamento_hereditario` bigint
);

CREATE TABLE `hereditario_intestado` (
  `id` SERIAL PRIMARY KEY,
  `orden_defucion` bigint,
  `colegiado` bigint,
  `representante_legal` bigint,
  `fecha_ingreso` DATE
);

CREATE TABLE `anotaciones` (
  `anotacion_id` SERIAL PRIMARY KEY,
  `finca_id` bigint,
  `texto` TEXT,
  `fecha` DATE
);

CREATE TABLE `banco` (
  `id` serial PRIMARY KEY,
  `nombre` varchar(72),
  `codigo` bigint,
  `direccion` varchar(78),
  `telefono` int,
  `correo` varchar(70)
);

CREATE TABLE `periodo` (
  `id` serial PRIMARY KEY,
  `periodo` varchar(60)
);

CREATE TABLE `credito` (
  `id` serial PRIMARY KEY,
  `tipo` varchar(45)
);

CREATE TABLE `hipotecas` (
  `id` SERIAL PRIMARY KEY,
  `representante_legal` bigint,
  `tipo_credio` bigint,
  `porcentaje` int,
  `banco` bigint,
  `fecha_emision` date,
  `fecha_expiracion` DATE,
  `id_finca` bigint,
  `colegiado` bigint,
  `periodo` bigint
);

CREATE TABLE `propiedad_horizontal` (
  `id` SERIAL PRIMARY KEY,
  `finca_id` bigint,
  `descripcion` TEXT,
  `fecha` DATE
);

CREATE TABLE `amenidades` (
  `id` SERIAL PRIMARY KEY,
  `tipo` VARCHAR(100)
);

CREATE TABLE `donaciones` (
  `id` SERIAL PRIMARY KEY,
  `colegiado` bigint,
  `representante_legal` bigint,
  `mensaje__aceptacion` txt,
  `id_finca_donada` bigint,
  `fecha_donacion` DATE
);

CREATE TABLE `permutas` (
  `id` SERIAL PRIMARY KEY,
  `colegiado` bigint,
  `representante_legal` bigint,
  `finca_id` bigint,
  `fecha` DATE
);

CREATE TABLE `adjudicacion` (
  `id` SERIAL PRIMARY KEY,
  `colegiado` bigint,
  `representante_legal` bigint,
  `finca_id` bigint,
  `fecha` DATE
);

CREATE TABLE `socios` (
  `id` serial PRIMARY KEY,
  `id_adjudicacion` bigint,
  `socios` biginit,
  `porcentaje` int
);

CREATE TABLE `desmembracion` (
  `id` SERIAL PRIMARY KEY,
  `colegiado` bigint,
  `representante_legal` bigint,
  `finca_id_desmembrar` bigint,
  `finca_id_nueva` bigint,
  `fecha` DATE
);

CREATE TABLE `duplicado` (
  `id` SERIAL PRIMARY KEY,
  `finca_id` bigint
);

CREATE TABLE `tipos_servidumbre` (
  `id` SERIAL PRIMARY KEY,
  `tipo` VARCHAR(200)
);

CREATE TABLE `servidumbres` (
  `id` SERIAL PRIMARY KEY,
  `tipo_servidumbre` bigint,
  `finca_id` bigint
);

ALTER TABLE `desmembraciones` ADD FOREIGN KEY (`colegiado`) REFERENCES `colegiado` (`id`);

ALTER TABLE `desmembraciones` ADD FOREIGN KEY (`representante`) REFERENCES `persona` (`cui`);

ALTER TABLE `desmembraciones` ADD FOREIGN KEY (`id_finca_matriz`) REFERENCES `finca` (`id`);

ALTER TABLE `desmembraciones` ADD FOREIGN KEY (`id_finca_nueva`) REFERENCES `finca` (`id`);

ALTER TABLE `colegiado` ADD FOREIGN KEY (`estado_colegiado`) REFERENCES `estado_colegiado` (`id`);

ALTER TABLE `colegiado` ADD FOREIGN KEY (`categoria`) REFERENCES `categoria_colegiado` (`id`);

ALTER TABLE `colegiado` ADD FOREIGN KEY (`especialidad`) REFERENCES `especialidad_colegiado` (`id`);

ALTER TABLE `unificacion` ADD FOREIGN KEY (`colegiado`) REFERENCES `colegiado` (`id`);

ALTER TABLE `unificacion` ADD FOREIGN KEY (`representante`) REFERENCES `persona` (`cui`);

ALTER TABLE `unificacion_fincas` ADD FOREIGN KEY (`id_unificacion`) REFERENCES `unificacion` (`id`);

ALTER TABLE `unificacion_fincas` ADD FOREIGN KEY (`id_fincas`) REFERENCES `finca` (`id`);

ALTER TABLE `gravamenes_licitaciones` ADD FOREIGN KEY (`id_unificacion`) REFERENCES `unificacion` (`id`);

ALTER TABLE `gravamenes_licitaciones` ADD FOREIGN KEY (`tipo_gravamenes_licitaciones`) REFERENCES `tipo_gravamenes_licitaciones` (`id`);

ALTER TABLE `titulacion_supletoria` ADD FOREIGN KEY (`juez_compotente`) REFERENCES `persona` (`cui`);

ALTER TABLE `titulacion_supletoria` ADD FOREIGN KEY (`colegiado`) REFERENCES `colegiado` (`id`);

ALTER TABLE `titulacion_supletoria` ADD FOREIGN KEY (`id_finca`) REFERENCES `finca` (`id`);

ALTER TABLE `propietarios` ADD FOREIGN KEY (`persona`) REFERENCES `persona` (`cui`);

ALTER TABLE `propietarios` ADD FOREIGN KEY (`titulacion_supletoria`) REFERENCES `titulacion_supletoria` (`id`);

ALTER TABLE `colidante` ADD FOREIGN KEY (`id_inmueble`) REFERENCES `finca` (`id`);

ALTER TABLE `coordenadas` ADD FOREIGN KEY (`id_inmueble`) REFERENCES `finca` (`id`);

ALTER TABLE `testigo` ADD FOREIGN KEY (`titulacion_supletoria`) REFERENCES `titulacion_supletoria` (`id`);

ALTER TABLE `testigo` ADD FOREIGN KEY (`id_colindante`) REFERENCES `colidante` (`id`);

ALTER TABLE `orden_defuncion` ADD FOREIGN KEY (`id_persona`) REFERENCES `persona` (`cui`);

ALTER TABLE `testamento_hereditario` ADD FOREIGN KEY (`orden_defucion`) REFERENCES `orden_defuncion` (`id`);

ALTER TABLE `testamento_hereditario` ADD FOREIGN KEY (`colegiado`) REFERENCES `colegiado` (`id`);

ALTER TABLE `testamento_hereditario` ADD FOREIGN KEY (`representante_legal`) REFERENCES `persona` (`cui`);

ALTER TABLE `herederos` ADD FOREIGN KEY (`id_persona`) REFERENCES `persona` (`cui`);

ALTER TABLE `herederos` ADD FOREIGN KEY (`id_testamento_hereditario`) REFERENCES `testamento_hereditario` (`id`);

ALTER TABLE `hereditario_intestado` ADD FOREIGN KEY (`orden_defucion`) REFERENCES `orden_defuncion` (`id`);

ALTER TABLE `hereditario_intestado` ADD FOREIGN KEY (`colegiado`) REFERENCES `colegiado` (`id`);

ALTER TABLE `hereditario_intestado` ADD FOREIGN KEY (`representante_legal`) REFERENCES `persona` (`cui`);

ALTER TABLE `anotaciones` ADD FOREIGN KEY (`finca_id`) REFERENCES `finca` (`id`);

ALTER TABLE `hipotecas` ADD FOREIGN KEY (`representante_legal`) REFERENCES `persona` (`cui`);

ALTER TABLE `hipotecas` ADD FOREIGN KEY (`tipo_credio`) REFERENCES `credito` (`id`);

ALTER TABLE `hipotecas` ADD FOREIGN KEY (`banco`) REFERENCES `banco` (`id`);

ALTER TABLE `hipotecas` ADD FOREIGN KEY (`id_finca`) REFERENCES `finca` (`id`);

ALTER TABLE `hipotecas` ADD FOREIGN KEY (`colegiado`) REFERENCES `colegiado` (`id`);

ALTER TABLE `hipotecas` ADD FOREIGN KEY (`periodo`) REFERENCES `periodo` (`id`);

ALTER TABLE `propiedad_horizontal` ADD FOREIGN KEY (`finca_id`) REFERENCES `finca` (`id`);

ALTER TABLE `donaciones` ADD FOREIGN KEY (`colegiado`) REFERENCES `colegiado` (`id`);

ALTER TABLE `donaciones` ADD FOREIGN KEY (`representante_legal`) REFERENCES `persona` (`cui`);

ALTER TABLE `donaciones` ADD FOREIGN KEY (`id_finca_donada`) REFERENCES `finca` (`id`);

ALTER TABLE `permutas` ADD FOREIGN KEY (`colegiado`) REFERENCES `colegiado` (`id`);

ALTER TABLE `permutas` ADD FOREIGN KEY (`representante_legal`) REFERENCES `persona` (`cui`);

ALTER TABLE `permutas` ADD FOREIGN KEY (`finca_id`) REFERENCES `finca` (`id`);

ALTER TABLE `adjudicacion` ADD FOREIGN KEY (`colegiado`) REFERENCES `colegiado` (`id`);

ALTER TABLE `adjudicacion` ADD FOREIGN KEY (`representante_legal`) REFERENCES `persona` (`cui`);

ALTER TABLE `adjudicacion` ADD FOREIGN KEY (`finca_id`) REFERENCES `finca` (`id`);

ALTER TABLE `socios` ADD FOREIGN KEY (`id_adjudicacion`) REFERENCES `adjudicacion` (`id`);

ALTER TABLE `socios` ADD FOREIGN KEY (`socios`) REFERENCES `persona` (`cui`);

ALTER TABLE `desmembracion` ADD FOREIGN KEY (`colegiado`) REFERENCES `colegiado` (`id`);

ALTER TABLE `desmembracion` ADD FOREIGN KEY (`representante_legal`) REFERENCES `persona` (`cui`);

ALTER TABLE `desmembracion` ADD FOREIGN KEY (`finca_id_desmembrar`) REFERENCES `finca` (`id`);

ALTER TABLE `desmembracion` ADD FOREIGN KEY (`finca_id_nueva`) REFERENCES `finca` (`id`);

ALTER TABLE `duplicado` ADD FOREIGN KEY (`finca_id`) REFERENCES `finca` (`id`);

ALTER TABLE `servidumbres` ADD FOREIGN KEY (`tipo_servidumbre`) REFERENCES `tipos_servidumbre` (`id`);

ALTER TABLE `servidumbres` ADD FOREIGN KEY (`finca_id`) REFERENCES `finca` (`id`);

ALTER TABLE `persona` ADD FOREIGN KEY (`ocupacion`) REFERENCES `ocupacion` (`id`);

ALTER TABLE `persona` ADD FOREIGN KEY (`estado_civi`) REFERENCES `estado_civi` (`id`);

ALTER TABLE `persona` ADD FOREIGN KEY (`sexo`) REFERENCES `sexo` (`id`);

ALTER TABLE `dpi` ADD FOREIGN KEY (`cui`) REFERENCES `persona` (`cui`);

ALTER TABLE `municipio` ADD FOREIGN KEY (`municipio`) REFERENCES `departamento` (`id`);

ALTER TABLE `jurisdiccion` ADD FOREIGN KEY (`id_tipo_zona`) REFERENCES `tipo_zona` (`id`);

ALTER TABLE `jurisdiccion` ADD FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`);

ALTER TABLE `tipo_libro` ADD FOREIGN KEY (`departamento`) REFERENCES `departamento` (`id`);

ALTER TABLE `finca` ADD FOREIGN KEY (`tipo_libro`) REFERENCES `tipo_libro` (`id`);

ALTER TABLE `finca` ADD FOREIGN KEY (`jurisdiccion`) REFERENCES `jurisdiccion` (`id`);

ALTER TABLE `finca` ADD FOREIGN KEY (`tipo_naturaleza`) REFERENCES `naturaleza` (`id`);

ALTER TABLE `finca` ADD FOREIGN KEY (`tipo_finca`) REFERENCES `tipo_finca` (`id`);

ALTER TABLE `finca` ADD FOREIGN KEY (`tipo_edificacion`) REFERENCES `tipo_edificacion` (`id`);

ALTER TABLE `compra_venta` ADD FOREIGN KEY (`moneda`) REFERENCES `moneda` (`id`);
