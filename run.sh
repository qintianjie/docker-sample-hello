#!/bin/sh
#nohup java -jar -Dserver.port=8081 /opt/service/docker-sample.jar &
java -version
echo `pwd`
echo "automatic build for docker"
java -jar -Dserver.port=8081 docker-sample.jar
