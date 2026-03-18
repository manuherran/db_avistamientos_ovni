-- Número de testimonios por año
SELECT anio, COUNT(*) AS total_testimonios
FROM t_testimonio
GROUP BY anio
ORDER BY total_testimonios DESC;

-- Número de incidentes por año
-- Sirve para detectar años con más avistamientos (picos de avistamientos, años más activos)
-- Permite ver si hubo “olas” de avistamientos en determinados años.

-- Creamos una vista con los incidentes (versión 1)
CREATE OR REPLACE VIEW v_incidentes AS
SELECT id_incidente, anio FROM t_testimonio GROUP BY id_incidente, anio;

SELECT anio, COUNT(*) AS total_avistamientos
FROM v_incidentes
GROUP BY anio
ORDER BY anio ASC;

-- Número de testimonios por día de la semana
SELECT dia_semana, COUNT(*) AS total_testimonios
FROM t_testimonio
GROUP BY dia_semana
ORDER BY total_testimonios DESC;

-- Número de avistamientos (o incidentes) por día de la semana
-- Días de la semana con más avistamientos
SELECT dia_semana, COUNT(*) AS total_incidentes
FROM v_incidentes
GROUP BY dia_semana
ORDER BY total_incidentes DESC;

-- Asumimos que todas las fechas son del incidente. No son fechas de los testimonios.
-- Todos los registros de un mismo incidente deberían tener la misma fecha
-- y podríamos añadir esos datos en la vista

-- Creamos una vista con los incidentes (versión 2)
-- Consideramos que el mismo incidente puede estar reportado en distintas provincias o países limítrofes.
-- En realidad, lo mismo podría pasar con la fecha, pero asumimos que no es así. Por ejemplo,
-- las 12 de la noche del 31 de diciembre podrían ser reportadas como el 1 de enero, etc.
CREATE OR REPLACE VIEW v_incidentes AS
SELECT id_incidente, anio, mes, dia_semana_num, dia_semana, franja_horaria, forma
FROM t_testimonio 
GROUP BY id_incidente, anio, mes, dia_semana_num, dia_semana, franja_horaria, forma
ORDER BY id_incidente;


-- Comprobamos si todos los testimonios de un mismo incidente tienen la misma fecha, etc.
-- Parece que sí es así
SELECT id_incidente, anio, mes, dia_semana_num, dia_semana
FROM t_testimonio ORDER BY id_incidente;

-- Otra forma de detectar errores
SELECT id_incidente, anio, mes, dia_semana_num, dia_semana, franja_horaria
FROM t_testimonio ORDER BY id_incidente, franja_horaria;

-- Por comodidad, vamos a ignorar los incidentes que tienen solo un testimonio
-- Usamos la consulta que ya habíamos hecho para detectar los incidentes con más de un testimonio
-- Número de valores no únicos: hay 3.590 incidentes que tienen más de un testimonio)
SELECT id_incidente FROM t_testimonio GROUP BY id_incidente HAVING COUNT(*) >= 2;
-- Lo guardamos en una vista para usarla después
CREATE OR REPLACE VIEW v_incidentes_multiples_testimonios AS
SELECT id_incidente FROM t_testimonio GROUP BY id_incidente HAVING COUNT(*) >= 2;

-- Ahora hago que el informe anterior solo muestre los incidentes con más de un testimonio
SELECT id_incidente, anio, mes, dia_semana_num, dia_semana, franja_horaria
FROM t_testimonio 
WHERE id_incidente IN (SELECT id_incidente FROM v_incidentes_multiples_testimonios)
ORDER BY id_incidente, franja_horaria;
-- 4, 15, 21...

-- Añado el id_testimonio
SELECT id_testimonio, id_incidente, anio, mes, dia_semana_num, dia_semana, franja_horaria
FROM t_testimonio 
WHERE id_incidente IN (SELECT id_incidente FROM v_incidentes_multiples_testimonios)
ORDER BY id_incidente, franja_horaria;

