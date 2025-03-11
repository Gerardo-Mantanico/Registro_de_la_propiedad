-- Encontrar ficas con posible duplicidad
SELECT f.finca_id, COUNT(d.finca_id) AS cantidad_duplicados
FROM duplicado d
JOIN propiedad_horizontal f ON d.finca_id = f.finca_id
GROUP BY f.finca_id
HAVING COUNT(d.finca_id) > 1;

- identificar fincas con coordenadas similares
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

-------------------------------------
-- Rastrear la cadena de desmembración de una finca matriz

WITH RECURSIVE cadena_desmembracion AS (
    SELECT d.finca_id_desmembrar, d.finca_id_nueva, d.fecha
    FROM desmembracion d
    WHERE d.finca_id_desmembrar = 100

    UNION ALL

    SELECT d.finca_id_desmembrar, d.finca_id_nueva, d.fecha
    FROM desmembracion d
    JOIN cadena_desmembracion cd 
    ON d.finca_id_desmembrar = cd.finca_nueva
)
SELECT * FROM cadena_desmembracion;

-------------------------

-- Determinar las fincas que ha cambiado de dueño mas veces, por alguna accion como compraventa. 

SELECT 
    c.finca_id,
    COUNT(c.id) AS total_transacciones
FROM (
    SELECT id_finca AS finca_id, id AS id FROM compra_venta
    UNION ALL
    SELECT finca_id AS finca_id, id FROM donaciones
    UNION ALL
    SELECT finca_id AS finca_id, id FROM permutas
    UNION ALL
    SELECT finca_id AS finca_id, id FROM adjudicacion
) AS c
GROUP BY c.finca_id
ORDER BY total_transacciones DESC;

-------------------
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


--------
--Determinar que fincas están involucradas en ligitios judiciales
SELECT 
    f.id AS id_finca,
    f.nombre AS nombre_finca,
    tgl.tipo AS tipo_litigio
FROM gravamenes_licitaciones gl
JOIN finca f ON gl.id_unificacion = f.id
JOIN tipo_gravamenes_licitaciones tgl ON gl.tipo_gravamenes_licitaciones = tgl.id
WHERE LOWER(tgl.tipo) LIKE '%litigio%' OR LOWER(tgl.tipo) LIKE '%demanda%'
ORDER BY f.id;

-------
Verificar fincas que tiene un área no coincide con su finca matriz
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




1️⃣ Fincas con posible duplicidad
Consulta
sql
Copiar
Editar
SELECT f1.id AS finca1, f2.id AS finca2, f1.nombre, f1.area
FROM finca f1
JOIN duplicado d ON f1.id = d.finca_id
JOIN finca f2 ON d.finca_id = f2.id
WHERE f1.id <> f2.id;
Tablas utilizadas
finca
duplicado
✅ Sí usé las tablas correctas.
2️⃣ Rastrear la cadena de desmembración de una finca matriz
Consulta
sql
Copiar
Editar
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
Tablas utilizadas
desmembraciones ✅ Sí usé la tabla correcta.
3️⃣ Fincas que han cambiado de dueño más veces (compra-venta)
Consulta
sql
Copiar
Editar
SELECT c.finca_id, f.nombre, COUNT(c.id) AS veces_vendida
FROM compra_venta c
JOIN finca f ON c.finca_id = f.id
GROUP BY c.finca_id, f.nombre
ORDER BY veces_vendida DESC;
Tablas utilizadas
compra_venta
finca
❌ Error: compra_venta no tiene finca_id.
✅ Corrección: Debemos relacionarla con propietarios.
sql
Copiar
Editar
SELECT p.titulacion_supletoria AS finca_id, f.nombre, COUNT(cv.id) AS veces_vendida
FROM compra_venta cv
JOIN propietarios p ON cv.colegiado = p.persona
JOIN finca f ON p.titulacion_supletoria = f.id
GROUP BY p.titulacion_supletoria, f.nombre
ORDER BY veces_vendida DESC;
4️⃣ Fincas hipotecadas y su estado actual
Consulta
sql
Copiar
Editar
SELECT h.id_finca, f.nombre, h.fecha_emision, h.fecha_expiracion,
       CASE 
           WHEN h.fecha_expiracion < CURDATE() THEN 'Expirada'
           ELSE 'Vigente'
       END AS estado
FROM hipotecas h
JOIN finca f ON h.id_finca = f.id;
Tablas utilizadas
hipotecas
finca ✅ Sí usé las tablas correctas.
5️⃣ Fincas en litigios judiciales
Consulta
sql
Copiar
Editar
SELECT f.id, f.nombre, g.tipo_gravamenes_licitaciones
FROM gravamenes_licitaciones g
JOIN finca f ON g.id_unificacion = f.id;
❌ Error: gravamenes_licitaciones no tiene un campo que vincule directamente a finca.
✅ Corrección: Debemos verificar unificacion:

sql
Copiar
Editar
SELECT f.id, f.nombre, g.tipo_gravamenes_licitaciones
FROM gravamenes_licitaciones g
JOIN unificacion u ON g.id_unificacion = u.id
JOIN finca f ON u.id_finca_nueva = f.id;

------------------


1️⃣ Fincas con posible duplicidad
sql
Copiar
Editar
SELECT f.finca_id, COUNT(d.finca_id) AS cantidad_duplicados
FROM duplicado d
JOIN propiedad_horizontal f ON d.finca_id = f.finca_id
GROUP BY f.finca_id
HAVING COUNT(d.finca_id) > 1;
2️⃣ Identificar fincas con coordenadas similares
sql
Copiar
Editar
SELECT c1.id_inmueble AS finca_1, c2.id_inmueble AS finca_2, 
       c1.longitud, c1.latitud
FROM coordenadas c1
JOIN coordenadas c2 
ON c1.longitud = c2.longitud 
AND c1.latitud = c2.latitud
AND c1.id_inmueble <> c2.id_inmueble;
3️⃣ Identificar fincas con mismo propietario y misma área
sql
Copiar
Editar
SELECT p1.id_finca AS finca_1, p2.id_finca AS finca_2, 
       p1.persona, f1.area
FROM propietarios p1
JOIN propietarios p2 ON p1.persona = p2.persona
JOIN unificacion f1 ON p1.id_finca = f1.id_finca_nueva
JOIN unificacion f2 ON p2.id_finca = f2.id_finca_nueva
WHERE f1.area = f2.area
AND p1.id_finca <> p2.id_finca;
4️⃣ Fincas con mismos colindantes
sql
Copiar
Editar
SELECT c1.id_inmueble AS finca_1, c2.id_inmueble AS finca_2
FROM colidante c1
JOIN colidante c2 
ON c1.punto_cardinal = c2.punto_cardinal
AND c1.id_inmueble <> c2.id_inmueble
GROUP BY c1.id_inmueble, c2.id_inmueble
HAVING COUNT(*) > 1;
5️⃣ Rastrear la cadena de desmembración de una finca matriz
Firebird no soporta WITH RECURSIVE, así que usamos una tabla temporal y un procedimiento almacenado:

sql
Copiar
Editar
CREATE GLOBAL TEMPORARY TABLE cadena_desmembracion (
    finca_id_desmembrar INTEGER,
    finca_id_nueva INTEGER,
    fecha DATE
) ON COMMIT PRESERVE ROWS;

SET TERM ^^ ;
EXECUTE BLOCK AS
DECLARE VARIABLE finca_id INTEGER = 100; -- Reemplazar con el ID de la finca inicial
BEGIN
    DELETE FROM cadena_desmembracion;

    INSERT INTO cadena_desmembracion (finca_id_desmembrar, finca_id_nueva, fecha)
    SELECT d.finca_id_desmembrar, d.finca_id_nueva, d.fecha
    FROM desmembracion d
    WHERE d.finca_id_desmembrar = :finca_id;

    WHILE (1=1) DO
    BEGIN
        INSERT INTO cadena_desmembracion (finca_id_desmembrar, finca_id_nueva, fecha)
        SELECT d.finca_id_desmembrar, d.finca_id_nueva, d.fecha
        FROM desmembracion d
        WHERE EXISTS (
            SELECT 1 FROM cadena_desmembracion cd 
            WHERE d.finca_id_desmembrar = cd.finca_id_nueva
        );
        
        IF (ROW_COUNT = 0) THEN LEAVE;
    END
END^^
SET TERM ; ^^

SELECT * FROM cadena_desmembracion;
6️⃣ Fincas que han cambiado de dueño más veces
sql
Copiar
Editar
SELECT 
    c.finca_id,
    COUNT(c.id) AS total_transacciones
FROM (
    SELECT id_finca AS finca_id, id FROM compra_venta
    UNION ALL
    SELECT finca_id AS finca_id, id FROM donaciones
    UNION ALL
    SELECT finca_id AS finca_id, id FROM permutas
    UNION ALL
    SELECT finca_id AS finca_id, id FROM adjudicacion
) c
GROUP BY c.finca_id
ORDER BY total_transacciones DESC;
7️⃣ Fincas hipotecadas y su estado actual
sql
Copiar
Editar
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
8️⃣ Fincas involucradas en litigios judiciales
sql
Copiar
Editar
SELECT 
    f.id AS id_finca,
    f.nombre AS nombre_finca,
    tgl.tipo AS tipo_litigio
FROM gravamenes_licitaciones gl
JOIN finca f ON gl.id_unificacion = f.id
JOIN tipo_gravamenes_licitaciones tgl ON gl.tipo_gravamenes_licitaciones = tgl.id
WHERE LOWER(tgl.tipo) LIKE '%litigio%' OR LOWER(tgl.tipo) LIKE '%demanda%'
ORDER BY f.id;
9️⃣ Fincas con área diferente a la de su finca matriz
sql
Copiar
Editar
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
Estas conversiones aseguran compatibilidad con Firebird. 🚀

