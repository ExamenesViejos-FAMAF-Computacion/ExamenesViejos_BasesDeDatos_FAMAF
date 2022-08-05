Carga de datos
==============

Para cargar los datos primero ejecutar el archivo de esquema:

    mysql -u <user> -h <host> -p<password> < ddl-vivero.sql

Luego correr el archivo de carga de datos, este es importante correrlo desde
la consola ya que es un archivo grande y editores del estilo "DBeaver" o
"MySQL Workbench" pueden tener problemas levantando un editor con todo el
archivo (salvo que exista alguna manera de cargar los datos sin tener que
levantarlos en un editor):

    mysql -u <user> -h <host> -p<password> < data-vivero.sql

Por supuesto, adapten los valores <user>, <host> y <password> como corresponda.
Tener en cuenta que el archivo `ddl-vivero.sql` crea la BD, luego si su usuario
no tiene permisos para hacerlo puede fallar. Por otro lado, `data-vivero.sql`
puede llegar a tardar un rato en cargar.

**NOTA:** No podrán todavía crear la tabla `DETALLES_FACTURAS` (ni cargar sus
datos) puesto que depende de una tabla que crearán durante el parcial.

