#Apisul : Proof of Concept | Liquibase

##Design
The basic structure of the project is given in the following way:
<pre>
.
|-- changelogs/
|   |-- v1.xml
|   |-- v2.xml
|-- changesets/
|   |-- v1/
|	|	|-- sql-file-01.sql
|	|	|-- sql-file-02.sql
|   |-- v2/
|	|	|-- sql-file-01.sql
|	|	|-- sql-file-02.sql
|	|	|-- sql-file-03.sql
|-- database/
|   |-- test.sqlite
|-- driver/
|   |-- sqlite-jdbc-3.8.11.2.jar
|-- liquibase/
|-- changelog.xml
|-- run.sh
</pre>
####Attention
######`run.sh` Create all changelogs/changesets based in sql-files(inside changesets/versions/*.sql)