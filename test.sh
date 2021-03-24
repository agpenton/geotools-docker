#!/bin/bash
cd /code
mvn clean install -DskipTests
mvn clean install -pl :gt-jdbc-postgis -am -DskipTests
mvn clean install -Ponline -nsu
