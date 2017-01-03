#!/bin/sh
#nohup java -jar -Dserver.port=8081 /opt/service/docker-sample.jar &
java -version
echo `pwd`
java -jar -Dserver.port=8081 docker-sample.jar
