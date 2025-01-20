#Basicos
SHOW DATABASES;
USE {database};
SHOW (FULL) TABLES;
DESCRIBE {table_name};

#------------------------------------------------------------
#------------------------------------------------------------
#Hacer schemas, ejemplos
CREATE TABLE country ( 
`Code` char(3) NOT NULL AUTO_INCREMENT DEFAULT '', 
`CountryName` varchar(60) NOT NULL DEFAULT '', 
`Continent` varchar(30) NOT NULL DEFAULT '',
[...]
`Capital` int DEFAULT '0',
`Code2` char(2) NOT NULL DEFAULT '',
PRIMARY KEY (`Code`));

CREATE TABLE city (
`ID` int NOT NULL AUTO_INCREMENT,
`CityName` varchar(60) NOT NULL DEFAULT '',
`CountryCode` char(3) NOT NULL DEFAULT '',
[...]
PRIMARY KEY (`ID`),
KEY `CountryCode` (`CountryCode`), 
CONSTRAINT `fk_city_country` FOREIGN KEY (`CountryCode`) REFERENCES `country` (`Code`)
);

#toda foreign key es una constraint con un nombre unico, se hace con esos 2 renglones

CREATE TABLE continent (
`ContinentName` varchar(30) NOT NULL DEFAULT '',
[...]
PRIMARY KEY (`ContinentName`)
);

#Conviene hacerlas cuando se crea la tabla, pero si hay que agregarla de forma retroactiva se hace asi
ALTER TABLE country ADD CONSTRAINT fk_country_continent FOREIGN KEY (Continent) REFERENCES continent(ContinentName);

INSERT INTO continent VALUES ('Africa', '30370000', '20.4', 'Cairo, Egypt');
INSERT INTO continent VALUES ('Antarctica', '14000000', '9.2', 'McMurdo Station');
INSERT INTO continent VALUES ('Asia', '44579000', '29.5', 'Mumbai, India');

#otro coso
ALTER TABLE {tabla} DROP COLUMN {columna};
ALTER TABLE {tabla} ADD COLUMN {columna} {descripcion de la columna};

#Restricciones: NOT NULL, AUTO_INCREMENT, DEFAULT {valor} (respetar tipo), UNIQUE
#PRIMARY KEY = UNIQUE NOT NULL



#------------------------------------------------------------
#------------------------------------------------------------
#SELECTS
SELECT (*, DISTINCT, {'literal'}) col1 (AS alias), col2 (AS alias), ... 
FROM {tabla1 AS alias1, tabla2 AS alias2, ...}
(WHERE expr)
(ORDER BY {columna ASC/DESC}, {columna ASC/DESC}...)
(LIMIT n)

#SELECT
#Ponerle un literal en el show hace que aparezca una columna con ese nombre y todas las filas tengan ese literal de contenido
#Se puede usar el alias de las tablas del FROM dentro del SELECT, como alias.col
#Se pueden poner aggregators como COUNT(DISTINCT), MAX, MIN, AVG
#Ver temas de GROUP BY mas adelante

#FROM
#listar mas de una tabla sin nada mas les hace una especie de prod cartesiano

#WHERE
#Se filtran columnas como col_i {=, !=, <, >, <=, >=, LIKE (para strings), BETWEEN x AND y, IS null, IS NOT null} {valor}
#LIKE ==> % para comodin substring, _ para comodin de caracter
#Se concatenan los filtros con AND, OR, NOT

#JOINS
SELECT _ FROM {tabla A}
{INNER, LEFT, RIGHT, FULL} JOIN
{tabla B}
ON {condicion};

#El join genera una tabla nueva con las columnas que se piden en el SELECT
#INNER JOIN se queda solo con las filas en donde se cumple la condicion
#LEFT O RIGHT se queda con las filas que coinciden, y ademas con las de la tabla principal (la de LEFT o RIGHT), pero pone nulls en las columnas que son de la otra tabla
#FULL lo que hace es una combinacion, como que concatena la tabla de hacer INNER, con la de hacer LEFT y después con la de RIGHT
#Que no es lo mismo que prod cartesiano porque este implica combinar en una fila entries de las tablas que no satisfacen la condicion


#Operaciones de conjuntos (no es lo mismo que joins)
SELECT {tabla A}
{UNION, INTERSECT, EXCEPT} (ALL) #ALL para retener duplicados
SELECT {tabla B}

#Nada, UNION hace union de conjuntos, INTERSECT interseccion y EXCEPT hace A - B

#QUERIES ANIDADAS

#Se puede hacer una subquery ENTRE PARENTESIS en las clausulas SELECT, FROM o WHERE.
#Para el SELECT, la subquery tiene que devolver si o si una fila que tenga una sola columna REVISAR
#Para el FROM, se genera dentro de la subquery una tabla, que se toma como cualquier otra tabla para el FROM.
#Se pueden usar "nombres correlacionales" que es básicamente scope (alcance) de las variables, pero para tablas.
#Todo alias hecho para una tabla fuera de la subquery se puede usar dentro de la subquery, y si se define de nuevo el alias toma precedencia el local (pls dont do this)
#Para el WHERE es armarle una tabla con la que hace IN/NOT IN. La tabla resultado tiene que tener una sola columna, y hace intersección de conjuntos con esa tabla.
#También se puede usar EXISTS, NOT EXISTS. Hay comparadores para todo el conjunto, como hacer WHERE A.col > ALL (subquery), lo mismo para otros operadores aritméticos.
#También se le puede dar una lista de valores (que de query no tiene nada) para el IN/NOT IN

#Está el WITH para hacer tablas temporales con un alias que te deja más clara la query

#Agregaciones
#MAX, MIN, AVG, COUNT (DISTINCT), SUM, ...
#Se usa GROUP BY para hacer conjuntos de filas que tengan el mismo valor en la columna que se pida para el GROUP.
#Si se quieren tener columnas no agregadas en el SELECT, tienen que estar en el GROUP BY
#HAVING y WHERE: Ambos son un WHERE, solo que el WHERE se checkea antes de hacer GROUP BY, el HAVING después.

#Funciones, triggers y cosos
#Es programar SQL. Sintaxis --> ver filminas
#La diferencia entre funcion y procedure es que funcion es que ya conocemos como funcion, y procedure no tiene valor de retorno, sino que se le da la variable a modificar como OUT
#Funciones no pueden modificar la BD, son para hacer queries y sacar algún dato. Procedimientos si
#Funciones se llaman dentro de queries, procedimientos se llaman a mano usando EXEC o CALL
#Loops y repeticiones -> filminas
 
#Triggers se hacen con respecto a una tabla, cuando se le hace un INSERT, UPDATE o DELETE. Se puede hacer antes o después del evento
#Sintaxis -> filminas

#Vistas
#Es una query prealmacenada. Sintaxis: CREATE (MATERIALIZED) VIEW {view} AS {aca la query}
#Las vistas se guardan como su query, no su resultado, a menos que se la haga MATERIALIZED, entonces guarda el resultado y lo va actualizando
#Las vistas materializadas ocupan memoria (redundancia) pero ahorran tiempo si es una query que se hace muy seguido

#Seguridad, permisos, roles
{GRANT/REVOKE} {SELECT, INSERT, UPDATE, DELETE}(columnas)
ON {tabla o vista}
TO {usuario o rol};

#Roles
CREATE ROLE {rol};
GRANT {rol} TO {user};

GRANT {SELECT, INSERT, UPDATE, DELETE} ON {tabla o view}
TO {rol};

#Se puede dar un rol a un rol
GRANT {rol a} TO {rol b};

#Transacciones
#Bloques de queries y modificaciones de la BD que se hace todo o nada y cumple con el resto del ACID

BEGIN TRANSACTION;
	{query}
	...
	{query}
COMMIT;

#Se puede usar la llamada ROLLBACK si algo falla dentro de la serie de queries (verificar esas cosas de alguna forma :) )
#Se pueden poner SAVEPOINT para separar la serie de queries en pasos a los cuales rollbackear si algo falla, asi no se pierde toda la query
#Existen las distribuidas
