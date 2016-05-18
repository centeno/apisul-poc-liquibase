# !/usr/bin/env bash

changesets="changesets/"
changelogs="changelogs/"

if [ "$1" != "" ] ; then
    rm "$changelogs$1.xml"
fi

for version in $(find $changesets* -type d); do 
	content='<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.3.xsd">\r\n'
	c=1
	if [ ! -f "${version/$changesets/$changelogs}.xml" ]; then
		for script in $(find $version -type f -name '*.sql'); do 
			v=${version:${#changesets}}.$c
			(( c++ ))
			content="$content<changeSet author='script' id='$v'><sqlFile path='$script' /></changeSet>\r\n"
		done
		echo -e "$content</databaseChangeLog>" >> "${version/$changesets/$changelogs}.xml"
	fi
done


#java -jar liquibase/liquibase.jar --classpath=driver/sqlite-jdbc-3.8.11.2.jar --driver=org.sqlite.JDBC --url="jdbc:sqlite:database/test.sqlite" --changeLogFile="changelog.xml" --logLevel "debug" migrate
java -jar liquibase/liquibase.jar --classpath=driver/sqlite-jdbc-3.8.11.2.jar --driver=org.sqlite.JDBC --url="jdbc:sqlite:database/test.sqlite" --changeLogFile="changelog.xml" migrate