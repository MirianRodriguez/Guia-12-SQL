use nba;
SELECT * from nba.jugadores;
SELECT * from nba.estadisticas;
SELECT * from nba.equipos;
SELECT * from nba.partidos;
#1
#1-1
select count(*) as cantidad from estadisticas where asistencias_por_partido >=(SELECT max(Asistencias_por_partido) from estadisticas);
#resultado= candado A posicion 2
#1-2
SELECT sum(peso) from jugadores as j INNER JOIN equipos as e on j.nombre_equipo=e.nombre WHERE conferencia='East' and posicion like '%C%';
#clave = 14043 
#2
#2-1
select count(jugador) from estadisticas where asistencias_por_partido > (SELECT count(*) from jugadores where nombre_equipo='Heat');
#resultado = candado B posición 3
#2-2
select count(*) from partidos where temporada like '%99%';
#clave=3480
#3
#3-1
SELECT (count(*)/(select count(*) from jugadores where peso>= 195)+0.9945) as posicion_candado 
from jugadores as j join equipos as e on j.nombre_equipo=e.nombre WHERE procedencia='michigan' and conferencia='west';
#resultado= candado C posición 1
#3-2
SELECT floor(avg(puntos_por_partido)+ count(asistencias_por_partido) + sum(tapones_por_partido)) as codigo
from estadisticas as es INNER join jugadores as j on es.jugador=j.codigo
INNER join equipos as e on j.nombre_equipo=e.nombre
where division='central';
#clave = en este punto no comprendimos bien la consigna. Si usamos COUNT en asistencia por partido el resultado es 631,
#si usamos SUM, el resultado nos da 1038;
#4
#4-1
SELECT round(sum(tapones_por_partido)) from jugadores as j INNER join estadisticas as e on j.codigo=e.jugador
where nombre='Corey Maggette' and temporada like '00/01';
#resultado= candado D posición 4
#4-2
SELECT floor(sum(puntos_por_partido)) from jugadores as j INNER join estadisticas as e on j.codigo=e.jugador where procedencia='argentina';
#clave = 191
 
	
 
 

 
 




