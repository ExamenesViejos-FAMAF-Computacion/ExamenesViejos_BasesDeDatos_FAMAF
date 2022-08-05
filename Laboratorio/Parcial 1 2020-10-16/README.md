Carga de datos
==============

Para cargar los datos primero ejecutar el archivo de esquema:

    mysql -u <user> -h <host> -p<password> < schema.sql

Luego correr el archivo de carga de datos, este es importante correrlo desde
la consola ya que es un archivo grande y editores del estilo "DBeaver" o
"MySQL Workbench" pueden tener problemas levantando un editor con todo el
archivo (salvo que exista alguna manera de cargar los datos sin tener que
levantarlos en un editor):

    mysql -u <user> -h <host> -p<password> < data.sql

Por supuesto, adapten los valores <user>, <host> y <password> como corresponda.
Tener en cuenta que el archivo `schema.sql` crea la BD, luego si su usuario no
tiene permisos para hacerlo puede fallar. Por otro lado, `data.sql` puede
llegar a tardar un rato en cargar.

