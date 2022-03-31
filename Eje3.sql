#1 Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;

#2 Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

#3 Lista todas las columnas de la tabla producto
SELECT * FROM producto;

#4 
/*Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor
del precio.*/
SELECT nombre, ROUND(precio) FROM producto;

#5 Lista el código de los fabricantes que tienen productos en la tabla producto
SELECT codigo_fabricante FROM producto;

#10
/*Lista el código de los fabricantes que tienen productos en la tabla producto, sin mostrar los
repetidos.*/
SELECT DISTINCT codigo_fabricante FROM producto;

#11 Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

#12 
/*Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente
y en segundo lugar por el precio de forma descendente.*/
SELECT nombre, precio FROM producto ORDER BY nombre, precio DESC;

#13 Devuelve una lista con las 5 primeras filas de la tabla fabricante
SELECT * FROM fabricante LIMIT 5;

#14
/*Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y
LIMIT)*/
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;

#15
/*Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y
LIMIT)*/
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

#16 Lista el nombre de los productos que tienen un precio menor o igual a $120
SELECT nombre FROM producto WHERE precio <= 120;

#17 Lista todos los productos que tengan un precio entre $60 y $200. Utilizando el operador BETWEEN.
SELECT nombre, precio FROM producto WHERE precio BETWEEN 60 AND 200;

#18 Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN
SELECT * FROM producto WHERE codigo_fabricante IN (1, 3, 5);

#23 
/*Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el
nombre.*/
SELECT nombre FROM producto WHERE nombre LIKE '%portatil%';

#1 
/*Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre
del fabricante, de todos los productos de la base de datos */
SELECT p.codigo as cod_prod, p.nombre as producto, f.codigo as cod_fab, f.nombre as fabricante 
FROM fabricante as f right join producto as p on f.codigo = p.codigo_fabricante;

#2
/*Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden
alfabético.*/
SELECT p.nombre as producto, precio, f.nombre as fabricante 
FROM fabricante as f right join producto as p on f.codigo = p.codigo_fabricante 
ORDER BY f.nombre;

#3
/*Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato*/
SELECT p.nombre as producto, precio, f.nombre as fabricante 
FROM fabricante as f right join producto as p on f.codigo = p.codigo_fabricante 
HAVING MIN(precio);

#4  Devuelve una lista de todos los productos del fabricante Lenovo
SELECT p.nombre as producto
FROM fabricante as f right join producto as p on f.codigo = p.codigo_fabricante 
WHERE f.nombre like "lenovo";

#5
/*Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que
$200.*/
SELECT p.nombre as producto, precio, f.nombre as fabricante
FROM fabricante as f right join producto as p on f.codigo = p.codigo_fabricante 
WHERE f.nombre like "crucial" AND precio > 200;

#6
/*Devuelve un listado con todos los productos de los fabricantes Asus, HewlettPackard. Utilizando el
operador IN.*/
SELECT p.nombre as producto, f.nombre as fabricante
FROM fabricante as f right join producto as p on f.codigo = p.codigo_fabricante
WHERE f.nombre IN ("Asus", "Hewlett-Packard");

#7
/*Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los
productos que tengan un precio mayor o igual a $180. Ordene el resultado en primer lugar por el
precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)*/

#1
/*Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los
productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que
no tienen productos asociados.*/
SELECT f.nombre as fabricante, p.nombre as producto
FROM fabricante as f LEFT JOIN producto as p ON f.codigo = p.codigo_fabricante;

#2
/*Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto
asociado*/
SELECT f.nombre as fabricante
FROM fabricante as f LEFT JOIN producto as p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo HAVING COUNT(p.nombre) = 0;

#1 Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN)
#SELECT codigo FROM fabricante WHERE nombre like "lenovo";
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre like "lenovo");

#2 
/*Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro
del fabricante Lenovo. (Sin utilizar INNER JOIN).*/
#SELECT MAX(precio) as mayor_precio_lenovo FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre like "lenovo");
SELECT * FROM producto WHERE precio = 
(SELECT MAX(precio) as mayor_precio_lenovo FROM producto WHERE codigo_fabricante = 
(SELECT codigo FROM fabricante WHERE nombre like "lenovo"));

#3 Lista el nombre del producto más caro del fabricante Lenovo.
SELECT MAX(precio) as mayor_precio_lenovo, nombre FROM producto WHERE codigo_fabricante = 
(SELECT codigo FROM fabricante WHERE nombre like "lenovo");

#4
/*Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos
sus productos.*/
#SELECT codigo FROM fabricante WHERE nombre like "Asus";
/*SELECT AVG(precio) FROM producto WHERE codigo_fabricante = 
(SELECT codigo FROM fabricante WHERE nombre like "Asus");*/

SELECT * FROM producto WHERE precio > 
(SELECT AVG(precio) FROM producto WHERE codigo_fabricante = 
(SELECT codigo FROM fabricante WHERE nombre like "Asus")) AND codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre like "Asus");

#1
/*Devuelve los nombres de los fabricantes que tienen productos asociados.
(Utilizando IN o NOT IN).*/
#SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante WHERE codigo IN (SELECT DISTINCT codigo_fabricante FROM producto);

#2 
/*Devuelve los nombres de los fabricantes que no tienen productos asociados.
(Utilizando IN o NOT IN).*/
SELECT nombre FROM fabricante WHERE codigo NOT IN (SELECT DISTINCT codigo_fabricante FROM producto);

#1
/*Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de
productos que el fabricante Lenovo*/



