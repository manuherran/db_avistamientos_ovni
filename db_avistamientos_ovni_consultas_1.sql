-- Número de valores diferentes (lista de valores únicos)
SELECT DISTINCT id_testimonio FROM t_testimonio;
SELECT DISTINCT id_incidente FROM t_testimonio;

-- Número de valores diferentes (cuenta los valores únicos)
SELECT COUNT(DISTINCT id_testimonio) FROM t_testimonio;
SELECT COUNT(DISTINCT id_incidente) FROM t_testimonio;


-- Número de testimonios por cada testimonios: obviamente es uno
SELECT id_testimonio, COUNT(*) FROM t_testimonio
GROUP BY id_testimonio ORDER BY COUNT(*) DESC;

-- Número de testimonios por cada incidente
SELECT id_incidente, COUNT(*) FROM t_testimonio
GROUP BY id_incidente ORDER BY COUNT(*) DESC;

-- Número de valores únicos (incidentes que tienen solo un testimonio)
SELECT id_testimonio FROM t_testimonio GROUP BY id_testimonio HAVING COUNT(*) = 1;
SELECT id_incidente FROM t_testimonio GROUP BY id_incidente HAVING COUNT(*) = 1;

