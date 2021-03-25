#!/bin/bash
cd /code
#mvn clean install -DskipTests=true
mvn clean install -pl :gt-jdbc-postgis -am -nsu -DskipTests=true
mvn clean install -pl :gt-jdbc-postgis -Ponline -nsu
mvn surefire-report:report-only
#mvn clean install -Ponline -nsu
