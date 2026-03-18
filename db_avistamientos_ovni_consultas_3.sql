-- Días de la semana con más avistamientos (¿más en viernes o sábado? ¿ocio nocturno?)
SELECT dia_semana, COUNT(*) AS total
FROM v_incidentes
GROUP BY dia_semana
ORDER BY total DESC;

-- Franja horaria con más avistamientos
SELECT franja_horaria, COUNT(*) AS total
FROM v_incidentes
GROUP BY franja_horaria
ORDER BY total DESC;

-- Formas de OVNI más reportadas
SELECT forma, COUNT(*) AS total
FROM v_incidentes
GROUP BY forma
ORDER BY total DESC
LIMIT 30;

-- Creamos la vista de formas distintas
CREATE OR REPLACE VIEW v_forma AS
SELECT DISTINCT forma FROM t_testimonio
;


-- Avistamientos con mayor credibilidad
SELECT id_incidente, municipio, fecha, num_testigos, duracion_segundos
FROM t_testimonio
WHERE num_testigos >= 5
AND duracion_segundos > 30
AND hubo_foto_o_video = 1
ORDER BY num_testigos DESC;

-- Sumamos el número de testigos de todos los testimonios
SELECT SUM(num_testigos) AS total_testigos FROM t_testimonio;

-- Funciones de agregación en SQL: COUNT, SUM, AVG, MIN, MAX




