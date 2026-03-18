-- Número de valores diferentes (lista de valores únicos)
SELECT DISTINCT id_testimonio FROM t_testimonio;
SELECT DISTINCT id_incidente FROM t_testimonio;

-- Número de valores diferentes (cuenta los valores únicos)
SELECT COUNT(DISTINCT id_testimonio) FROM t_testimonio;
SELECT COUNT(DISTINCT id_incidente) FROM t_testimonio;

-- Número de valores únicos
