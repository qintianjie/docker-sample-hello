#!/bin/sh
port=${1:-8081}
service_name=${2:-docker-sample.jar}
path=${3:-/opt/service}

java -version
echo `pwd`
echo "automatic build for docker"
nohup java -jar -Dserver.port=${port} ${path}/${service_name} 
