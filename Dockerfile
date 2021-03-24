FROM ubuntu:bionic

RUN apt update && apt upgrade -y
ADD ./jdk-8u281-linux-x64.tar.gz /usr/lib/jvm
RUN update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_281/bin/java" 1
RUN update-alternatives --set java /usr/lib/jvm/jdk1.8.0_281/bin/java
RUN apt install maven git -y
RUN git clone -b gt-docker https://github.com/agpenton/geotools.git /code
COPY sqlserver.properties ~/.geotools/sqlserver.properties
COPY test.sh /test/test.sh
RUN chmod 777 /test/test.sh
