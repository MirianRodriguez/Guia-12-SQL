#1
SELECT * FROM empleados;

#2
SELECT * FROM departamentos;

#3
SELECT nombre_depto FROM departamentos;

#4
SELECT nombre, sal_emp FROM empleados;

#5
SELECT comision_emp FROM empleados;

#6
SELECT * FROM empleados WHERE cargo_emp = "Secretaria";

#7
SELECT * FROM empleados WHERE cargo_emp = "Vendedor" ORDER BY nombre;

#8
SELECT nombre, cargo_emp FROM empleados ORDER BY sal_emp;

#9 Elabore un listado donde para cada fila, figure el alias ‘Nombre’ y ‘Cargo’ para las respectivas tablas de empleados.

#10
SELECT sal_emp, comision_emp FROM empleados WHERE id_depto = 2000 ORDER BY comision_emp;

#11 
/*Obtener el valor total a pagar que resulta de sumar el salario y la comisión de los empleados
del departamento 3000 una bonificación de 500, en orden alfabético del empleado.*/

#12
SELECT * FROM empleados WHERE nombre LIKE "J%";

#13
SELECT sal_emp, comision_emp, (sal_emp + comision_emp) AS salario_total, nombre FROM empleados WHERE comision_emp > 1000;

#14
SELECT sal_emp, comision_emp, (sal_emp + comision_emp) AS salario_total, nombre FROM empleados WHERE comision_emp = 0;

#15
SELECT * FROM empleados WHERE comision_emp > sal_emp;

#16
SELECT * FROM empleados WHERE comision_emp <= (sal_emp*0.3);

#17
SELECT nombre FROM empleados WHERE nombre NOT LIKE "%MA%";

#18
/*Obtener los nombres de los departamentos que sean “Ventas” ni “Investigación” ni
‘Mantenimiento.*/
SELECT nombre_depto FROM departamentos WHERE nombre_depto <> "Ventas" AND nombre_depto <> "Investigacion" AND nombre_depto <> "Mantenimiento";

#19
/*Ahora obtener los nombres de los departamentos que no sean “Ventas” ni “Investigación” ni
‘Mantenimiento.*/

#20
SELECT MAX(sal_emp) FROM empleados;

#21
SELECT MAX(nombre) FROM empleados;

#22
SELECT MAX(sal_emp) as max, MIN(sal_emp) as min, (MAX(sal_emp) -  MIN(sal_emp)) as diferencia FROM empleados;

#23
SELECT AVG(sal_emp), id_depto FROM empleados group by id_depto;

#24
SELECT id_depto, COUNT(*) AS cant_emp FROM empleados group by id_depto having COUNT(*) > 3;

#25
SELECT cod_jefe, COUNT(*) AS cant_emp FROM empleados group by cod_jefe having COUNT(*) >= 2;

#26
#SELECT id_depto, COUNT(*) AS cant_emp FROM empleados group by id_depto having COUNT(*) = 0;

#27
#SELECT AVG(sal_emp) as sal_prom FROM empleados;
SELECT nombre as empleado, id_depto as depto FROM empleados WHERE sal_emp >= (SELECT AVG(sal_emp) as sal_prom FROM empleados) order by id_depto;