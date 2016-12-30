FROM qintianjie/centos7java8:v0
MAINTAINER Jack Qin <tianjieqin@126.com>

ENV servicePath /opt/service
RUN if [ ! -d "$servicePath " ]; then mkdir "$servicePath "; fi 

WORKDIR $servicePath

# make sure docker-sample.jar and Dockerfile in the same directory, else use relative path
ADD docker-sample.jar docker-sample.jar

## Build java application
#RUN git clone -b 1.0.2 https://github.com/qintianjie/docker-sample-hello.git \
#    && cd docker-sample-hello \
#    && chmod a+x run.sh \
#    && mv run.sh $servicePath \
#    && source ~/.bashrc \
#    && mvn clean package -Dmaven.test.skip \
#    && mv  target/docker-sample.jar $servicePath

EXPOSE 8080 8081
#ENTRYPOINT ["/bin/sh"]
ENTRYPOINT ["java", "-Dserver.port=8081", "-jar", "docker-sample.jar"]
RUN echo done
