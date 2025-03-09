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
  `fecha_expiracion` date,
  `foto` url,
  `firma` url
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
  `id` serila PRIMARY KEY,
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
  `jurisdiccion` bingint,
  `area` decimal(10,2),
  `tipo_naturaleza` bigint,
  `nombre` varchar(72),
  `tipo_finca` bigint,
  `edicacion` boolean,
  `tipo_edificacion` bigint
);

CREATE TABLE `derecho_propiedad` (
  `id` serila PRIMARY KEY,
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
  `observaciones` text,
  `colegiado` bigint[]
);

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
