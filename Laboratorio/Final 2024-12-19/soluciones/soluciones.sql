--FRANCISCO AYROLO
--BASES DE DATOS
--FINAL 2DA mesa, 19-12-2024

--EJERCICIO 1
--Listar nombre del proyecto y cantidad de horas trabajadas en total en el mismo de
--todos aquellos proyectos donde el total de horas trabajadas sea mayor o igual a
--50hs ordenados por el total de horas trabajadas de forma descendente.

--Al principio hacia INNER JOIN con la tabla de empleados también, para asegurarme
--de que no haya "trabajadores fantasma" pero bueno no hace falta realmente, o si, quien sabe

SELECT * FROM 
(
	SELECT pr.pname, SUM(wo.hours) AS total_hours 
	FROM works_on wo 
	INNER JOIN project pr ON wo.pno = pr.pnumber 
	GROUP BY pr.pnumber
) AS th
WHERE th.total_hours >= 50.0
ORDER BY total_hours DESC;

--EJERCICIO 2
--Listar SSN y nombre completo de aquellos empleados que solo trabajen en
--proyectos controlados por el departamento de Research. Mostrar el resultado
--ordenados por SSN de forma descendente.

(
	SELECT em.ssn, em.fname, em.lname 
	FROM department dept 
	INNER JOIN project pr ON dept.dnumber = pr.dnum AND dept.dname = "Research" 
	INNER JOIN works_on wo ON pr.pnumber = wo.pno 
	INNER JOIN employee em ON wo.essn = em.ssn 
	GROUP BY em.ssn
	ORDER BY em.ssn DESC
)
EXCEPT
(
	SELECT em.ssn, em.fname, em.lname 
	FROM department dept 
	INNER JOIN project pr ON dept.dnumber = pr.dnum AND dept.dname != "Research" 
	INNER JOIN works_on wo ON pr.pnumber = wo.pno 
	INNER JOIN employee em ON wo.essn = em.ssn 
	GROUP BY em.ssn
);

--DOS ACLARACIONES:
--Primero, confio en que mi query es correcta (no necesariamente la mas eficiente)
--Pero no veo por que uno de los empleados queda en la tabla, siendo que deberia cortarlo
--el EXCEPT
--Segundo, la query de acá abajo tambien sirve, es mas compacta pero usar el numero del
--departamento es susceptible a errores ya que puede cambiar el numero, y la consigna
--pide filtrar por nombre de departamento.

SELECT em.ssn, em.fname, em.lname 
FROM project pr
INNER JOIN works_on wo ON pr.pnumber = wo.pno 
INNER JOIN employee em ON wo.essn = em.ssn 
WHERE pr.dnum = 5 
GROUP BY em.ssn
ORDER BY em.ssn DESC;

--EJERCICIO 3 (LIBRE)
--Crear un procedimiento almacenado que dado un nombre
--de departamento (parámetro de entrada), debe listar el nombre de proyecto,
--cantidad de empleados y total de horas trabajadas para cada proyecto controlado
--por dicho departamento

DELIMITER $$

CREATE PROCEDURE `controlled_by_department` (
	IN `dept_name` STRING
)
BEGIN
	SELECT pr.pname, COUNT(*), SUM(wo.hours)
	FROM department dept 
	INNER JOIN project pr ON dept.dnumber = pr.dnum AND dept.dname = `dept_name`
	INNER JOIN works_on wo ON pr.pnumber = wo.pno 
	INNER JOIN employee em ON wo.essn = em.ssn
	GROUP BY pr.pname;

END $$

DELIMITER ;
