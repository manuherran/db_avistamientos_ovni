-- Número de valores diferentes. Hay 20.000 testimonios de 15.458 incidentes.
SELECT COUNT(DISTINCT id_testimonio) FROM t_testimonio;
SELECT COUNT(DISTINCT id_incidente) FROM t_testimonio;

-- Número de testimonios por cada incidente
SELECT id_incidente, COUNT(*) FROM t_testimonio
GROUP BY id_incidente ORDER BY COUNT(*) DESC;

-- Incidentes que tienen exactamente un testimonio ("valores únicos"): 11.868
SELECT id_incidente FROM t_testimonio GROUP BY id_incidente HAVING COUNT(*) = 1;

-- Número de valores únicos: hay 11.868 incidentes que tienen exactamente un testimonio)
SELECT COUNT(*) FROM (SELECT id_incidente FROM t_testimonio GROUP BY id_incidente HAVING COUNT(*) = 1) AS unique_incidents;

-- Número de valores únicos: hay 11.868 incidentes que tienen exactamente un testimonio)
SELECT COUNT(*) FROM (SELECT id_incidente FROM t_testimonio GROUP BY id_incidente HAVING COUNT(*) = 1) AS unique_incidents;

-- Número de valores no únicos: hay 3.590 incidentes que tienen más de un testimonio)
SELECT COUNT(*) FROM (SELECT id_incidente FROM t_testimonio GROUP BY id_incidente HAVING COUNT(*) >= 2) AS multiple_incidents;

-- Incidentes que tienen tres o más testimonios: 848
SELECT COUNT(*) FROM (SELECT id_incidente FROM t_testimonio GROUP BY id_incidente HAVING COUNT(*) >= 3) AS multiple_incidents;

-- Incidentes que tienen cuatro o más testimonios: 96
SELECT COUNT(*) FROM (SELECT id_incidente FROM t_testimonio GROUP BY id_incidente HAVING COUNT(*) >= 4) AS multiple_incidents;

-- Incidentes que tienen cinco o más testimonios: 5
SELECT COUNT(*) FROM (SELECT id_incidente FROM t_testimonio GROUP BY id_incidente HAVING COUNT(*) >= 5) AS multiple_incidents;

-- 11.868 + 3.590 = 15.458 incidentes en total, lo que coincide con el número de incidentes distintos que hay en la tabla t_testimonio.

-- En total son 8.132 reportes relativos a incidentes con más de un testimonio

-- Cuántos incidentes hay por cada número de testimonios. Por ejemplo, incidentes que tienen exactamente un testimonio, incidentes que tienen exactamente dos testimonios, etc.

-- Por claridad, hacemos una vista primero
-- Se trata de una vista que nos dice, por cada testimonio, cuantos testimonios hay
CREATE OR REPLACE VIEW v_incidentes_testimonios AS
SELECT id_incidente, COUNT(*) AS num_testimonios FROM t_testimonio
GROUP BY id_incidente ORDER BY COUNT(*) DESC;

-- Ahora hago una agrupación de la vista para contar cuántos incidentes hay por cada número de testimonios
SELECT num_testimonios, COUNT(*) AS num_incidentes FROM v_incidentes_testimonios
GROUP BY num_testimonios ORDER BY num_testimonios DESC;

-- La suma debe dar 15.458