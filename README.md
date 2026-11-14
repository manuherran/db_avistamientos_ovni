# db_avistamientos_ovni

**Synthetic MySQL database of UFO sightings in Spain, with a creation script and practice queries for SQL courses.**

*Base de datos sintética de avistamientos OVNI en España, creada para uso didáctico. **No contiene datos reales.***

## Contenido

| Archivo | Descripción |
|---|---|
| `db_avistamientos_ovni_creacion.sql` | Crea la base de datos `DB_avistamientos_ovni` y la tabla `t_testimonio` con 20.000 testimonios de 15.458 incidentes |
| `db_avistamientos_ovni_consultas_1.sql` … `_3.sql` | Consultas de práctica: recuentos, valores únicos, agrupaciones, calidad del dato… |

La tabla `t_testimonio` incluye fecha y hora, lugar (municipio, provincia, comunidad autónoma, habitantes, densidad), forma, color y movimiento del objeto, duración, número de testigos, descripciones, y columnas pensadas para ejercicios de limpieza de datos (`ruido_textual`, `posible_duplicado`, `calidad_registro`).

## Uso

```sql
SOURCE db_avistamientos_ovni_creacion.sql;
USE DB_avistamientos_ovni;
SELECT COUNT(*) FROM t_testimonio;
```

Después, abre los scripts de consultas y ejecútalos uno a uno.

## License

[Creative Commons Attribution 4.0 International (CC BY 4.0)](LICENSE). You may share and adapt this material for any purpose, including commercially, as long as you give appropriate credit.

## Author

[Manu Herrán](https://manuherran.com/) · [GitHub](https://github.com/manuherran)
