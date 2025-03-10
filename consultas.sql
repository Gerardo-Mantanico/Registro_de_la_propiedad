-- Encontrar ficas con posible duplicidad
SELECT f.id_finca, COUNT(d.id_finca) AS cantidad_duplicados
FROM duplicado d
JOIN propiedad_horizontal f ON d.id_finca = f.id_finca
GROUP BY f.id_finca
HAVING COUNT(d.id_finca) > 1;

-- Identificar fincas con coordenadas similares
SELECT c1.id_inmueble AS finca_1, c2.id_inmueble AS finca_2, 
       c1.longitud, c1.latitud
FROM coordenadas c1
JOIN coordenadas c2 
ON c1.longitud = c2.longitud 
AND c1.latitud = c2.latitud
AND c1.id_inmueble <> c2.id_inmueble;

-- Identificar fincas con mismo propietario y misma área
SELECT p1.id_finca AS finca_1, p2.id_finca AS finca_2, 
       p1.persona, f1.area
FROM propietarios p1
JOIN propietarios p2 ON p1.persona = p2.persona
JOIN unificacion f1 ON p1.id_finca = f1.id_finca_nueva
JOIN unificacion f2 ON p2.id_finca = f2.id_finca_nueva
WHERE f1.area = f2.area
AND p1.id_finca <> p2.id_finca;

--Fincas con mismos colindantes
SELECT c1.id_inmueble AS finca_1, c2.id_inmueble AS finca_2
FROM colidante c1
JOIN colidante c2 
ON c1.punto_cardinal = c2.punto_cardinal
AND c1.id_inmueble <> c2.id_inmueble
GROUP BY c1.id_inmueble, c2.id_inmueble
HAVING COUNT(*) > 1;

-- Rastrear la cadena de desmembración de una finca matriz
WITH RECURSIVE cadena_desmembracion AS (
    SELECT d.id_finca_desmembrar, d.id_finca_nueva, d.fecha
    FROM desmembracion d
    WHERE d.id_finca_desmembrar = 100

    UNION ALL

    SELECT d.id_finca_desmembrar, d.id_finca_nueva, d.fecha
    FROM desmembracion d
    JOIN cadena_desmembracion cd 
    ON d.id_finca_desmembrar = cd.finca_nueva
)
SELECT * FROM cadena_desmembracion;



-- Determinar las fincas que ha cambiado de dueño mas veces, por alguna accion como compraventa. 
SELECT 
    c.id_finca,
    COUNT(c.id) AS total_transacciones
FROM (
    SELECT id_finca AS id_finca, id AS id FROM compra_venta
    UNION ALL
    SELECT id_finca AS id_finca, id FROM donaciones
    UNION ALL
    SELECT id_finca AS id_finca, id FROM permutas
    UNION ALL
    SELECT id_finca AS id_finca, id FROM adjudicacion
) AS c
GROUP BY c.id_finca
ORDER BY total_transacciones DESC;

-- Obtener fincas que han sido hipotecadas y su estado actual
SELECT 
    h.id_finca,
    f.nombre AS nombre_finca,
    b.nombre AS banco,
    h.fecha_emision,
    h.fecha_expiracion,
    CASE 
        WHEN h.fecha_expiracion >= CURRENT_DATE THEN 'Vigente'
        ELSE 'Expirada'
    END AS estado_hipoteca
FROM hipotecas h
JOIN finca f ON h.id_finca = f.id
JOIN banco b ON h.banco = b.id
ORDER BY h.fecha_expiracion DESC;

-------- Determinar que fincas están involucradas en ligitios judiciales
SELECT 
    f.id AS id_finca,
    f.nombre AS nombre_finca,
    tgl.tipo AS tipo_litigio
FROM gravamenes_licitaciones gl
JOIN finca f ON gl.id_unificacion = f.id
JOIN tipo_gravamenes_licitaciones tgl ON gl.tipo_gravamenes_licitaciones = tgl.id
WHERE LOWER(tgl.tipo) LIKE '%litigio%' OR LOWER(tgl.tipo) LIKE '%demanda%'
ORDER BY f.id;

------- Verificar fincas que tiene un área no coincide con su finca matriz
SELECT 
    fm.id AS id_finca_matriz,
    fm.nombre AS nombre_finca_matriz,
    fm.area AS area_finca_matriz,
    fn.id AS id_finca_nueva,
    fn.nombre AS nombre_finca_nueva,
    fn.area AS area_finca_nueva
FROM desmembraciones d
JOIN finca fm ON d.id_finca_matriz = fm.id
JOIN finca fn ON d.id_finca_nueva = fn.id
WHERE fn.area > fm.area;


---------------------------------------------

----Fincas con posible duplicidad
SELECT f1.id AS finca1, f2.id AS finca2, f1.nombre, f1.area
FROM finca f1
JOIN duplicado d ON f1.id = d.id_finca
JOIN finca f2 ON d.id_finca = f2.id
WHERE f1.id <> f2.id;

-- Rastrear la cadena de desmembración de una finca matriz

WITH RECURSIVE cadena_desmembracion AS (
    SELECT id_finca_matriz, id_finca_nueva, 1 AS nivel
    FROM desmembraciones
    WHERE id_finca_matriz = ?  -- ID de la finca matriz

    UNION ALL

    SELECT d.id_finca_matriz, d.id_finca_nueva, cd.nivel + 1
    FROM desmembraciones d
    JOIN cadena_desmembracion cd ON d.id_finca_matriz = cd.id_finca_nueva
)
SELECT * FROM cadena_desmembracion;

----------------
SELECT c.id_finca, f.nombre, COUNT(c.id) AS veces_vendida
FROM compra_venta c
JOIN finca f ON c.id_finca = f.id
GROUP BY c.id_finca, f.nombre
ORDER BY veces_vendida DESC;



SELECT p.titulacion_supletoria AS id_finca, f.nombre, COUNT(cv.id) AS veces_vendida
FROM compra_venta cv
JOIN propietarios p ON cv.colegiado = p.persona
JOIN finca f ON p.titulacion_supletoria = f.id
GROUP BY p.titulacion_supletoria, f.nombre
ORDER BY veces_vendida DESC;

-- Fincas hipotecadas y su estado actual
SELECT h.id_finca, f.nombre, h.fecha_emision, h.fecha_expiracion,
       CASE 
           WHEN h.fecha_expiracion < CURDATE() THEN 'Expirada'
           ELSE 'Vigente'
       END AS estado
FROM hipotecas h
JOIN finca f ON h.id_finca = f.id;

--Fincas en litigios judiciales
SELECT f.id, f.nombre, g.tipo_gravamenes_licitaciones
FROM gravamenes_licitaciones g
JOIN finca f ON g.id_unificacion = f.id;


SELECT f.id, f.nombre, g.tipo_gravamenes_licitaciones
FROM gravamenes_licitaciones g
JOIN unificacion u ON g.id_unificacion = u.id
JOIN finca f ON u.id_finca_nueva = f.id;

