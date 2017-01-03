# Docker HUB:

https://hub.docker.com/u/qintianjie/

### Command
docker pull qintianjie/centos7java8  
docker build -t qintianjie/docker-sample-web:v0 .  
docker run -d -p 8082:8081 qintianjie/docker-sample-web:v0   
docker ps -la   
docker logs XXX  

### Verify:  
curl http://localhost:8082/hello/say?name=Jack  

### Others:
docker push qintianjie/docker-sample-web:v0  
docker rmi image_id   
docker rm  container_id  
docker stop xxx  



#Sample  

```
root@jackqin /opt/dev/docker/myweb $git clone https://github.com/qintianjie/docker-sample-hello.git
Cloning into 'docker-sample-hello'...
remote: Counting objects: 73, done.
remote: Compressing objects: 100% (54/54), done.
remote: Total 73 (delta 17), reused 62 (delta 6), pack-reused 0
Unpacking objects: 100% (73/73), done.
root@jackqin /opt/dev/docker/myweb $ll
total 4
drwxr-xr-x. 4 root root 4096 Jan  3 11:46 docker-sample-hello
root@jackqin /opt/dev/docker/myweb $cd docker-sample-hello/
root@jackqin /opt/dev/docker/myweb/docker-sample-hello $ll
total 13892
-rw-r--r--. 1 root root      837 Jan  3 11:46 Dockerfile
-rw-r--r--. 1 root root     1171 Jan  3 11:46 Dockerfile.centos7java8
-rw-r--r--. 1 root root 14203941 Jan  3 11:46 docker-sample.jar
-rw-r--r--. 1 root root     1528 Jan  3 11:46 pom.xml
-rw-r--r--. 1 root root      301 Jan  3 11:46 README.md
-rw-r--r--. 1 root root      151 Jan  3 11:46 run.sh
drwxr-xr-x. 4 root root       28 Jan  3 11:46 src
root@jackqin /opt/dev/docker/myweb/docker-sample-hello $docker build -t qintianjie/docker-sample-web:v0 .
Sending build context to Docker daemon 27.13 MB
Step 1 : FROM qintianjie/centos7java8:v0
 ---> ee4b195a3c12
Step 2 : MAINTAINER Jack Qin <tianjieqin@126.com>
 ---> Running in dba9dfd5d5c7
 ---> 63a81717ece5
Removing intermediate container dba9dfd5d5c7
Step 3 : ENV servicePath /opt/service
 ---> Running in 2e5477fccdbd
 ---> 09b704c3ca6b
Removing intermediate container 2e5477fccdbd
Step 4 : RUN if [ ! -d "$servicePath " ]; then mkdir "$servicePath "; fi
 ---> Running in f3f780ddf7cf
 ---> c221ffbfaa4f
Removing intermediate container f3f780ddf7cf
Step 5 : WORKDIR $servicePath
 ---> Running in 2813f07a26ef
 ---> 4b4ccb28ec32
Removing intermediate container 2813f07a26ef
Step 6 : ADD docker-sample.jar docker-sample.jar
 ---> 7cfc572e3f15
Removing intermediate container b8e09954c3df
Step 7 : ADD run.sh run.sh
 ---> 27880818d13b
Removing intermediate container a0e28ec45dcb
Step 8 : RUN chmod a+x run.sh     && ls -l
 ---> Running in f59f09ed48c4
total 13876
-rw-r--r--. 1 root root 14203941 Jan  3 03:46 docker-sample.jar
-rwxr-xr-x. 1 root root      151 Jan  3 03:46 run.sh
 ---> 4fcce251ce93
Removing intermediate container f59f09ed48c4
Step 9 : EXPOSE 8080 8081
 ---> Running in 49f8f2cb99f0
 ---> c6540e2a9c41
Removing intermediate container 49f8f2cb99f0
Step 10 : ENTRYPOINT /bin/sh run.sh
 ---> Running in afd8e9fcbd13
 ---> 9cb964c38af8
Removing intermediate container afd8e9fcbd13
Step 11 : RUN echo done
 ---> Running in 541599a93d60
done
 ---> 746c3eb5fe9d
Removing intermediate container 541599a93d60
Successfully built 746c3eb5fe9d
root@jackqin /opt/dev/docker/myweb/docker-sample-hello $docker run -d -p 8091:8081 qintianjie/docker-sample-web:v0 
8d3e9b87f82499205f652690ea2c104643d1155a42429401ede79af7f0734257
root@jackqin /opt/dev/docker/myweb/docker-sample-hello $docker ps -la
CONTAINER ID        IMAGE                             COMMAND             CREATED             STATUS              PORTS                              NAMES
8d3e9b87f824        qintianjie/docker-sample-web:v0   "/bin/sh run.sh"    6 seconds ago       Up 4 seconds        8080/tcp, 0.0.0.0:8091->8081/tcp   pedantic_lalande
root@jackqin /opt/dev/docker/myweb/docker-sample-hello $curl http://localhost:8091/hello/say
Hello worldroot@jackqin /opt/dev/docker/myweb/docker-sample-hello $curl http://localhost:8091/hello/say?name=Jack
Hello Jackroot@jackqin /opt/dev/docker/myweb/docker-sample-hello $
root@jackqin /opt/dev/docker/myweb/docker-sample-hello $
root@jackqin /opt/dev/docker/myweb/docker-sample-hello $docker logs pedantic_lalande
java version "1.8.0_112"
Java(TM) SE Runtime Environment (build 1.8.0_112-b15)
Java HotSpot(TM) 64-Bit Server VM (build 25.112-b15, mixed mode)
/opt/service

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v1.4.3.RELEASE)

2017-01-03 03:48:20.556  INFO 22 --- [           main] c.c.c.s.docker.DockerSampleApplication   : Starting DockerSampleApplication v1.0.2-SNAPSHOT on 8d3e9b87f824 with PID 22 (/opt/service/docker-sample.jar started by root in /opt/service)
2017-01-03 03:48:20.560  INFO 22 --- [           main] c.c.c.s.docker.DockerSampleApplication   : No active profile set, falling back to default profiles: default
2017-01-03 03:48:20.619  INFO 22 --- [           main] ationConfigEmbeddedWebApplicationContext : Refreshing org.springframework.boot.context.embedded.AnnotationConfigEmbeddedWebApplicationContext@5a2e4553: startup date [Tue Jan 03 03:48:20 UTC 2017]; root of context hierarchy
2017-01-03 03:48:22.560  INFO 22 --- [           main] s.b.c.e.t.TomcatEmbeddedServletContainer : Tomcat initialized with port(s): 8081 (http)
2017-01-03 03:48:22.574  INFO 22 --- [           main] o.apache.catalina.core.StandardService   : Starting service Tomcat
2017-01-03 03:48:22.575  INFO 22 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet Engine: Apache Tomcat/8.5.6
2017-01-03 03:48:22.675  INFO 22 --- [ost-startStop-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2017-01-03 03:48:22.675  INFO 22 --- [ost-startStop-1] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 2066 ms
2017-01-03 03:48:22.806  INFO 22 --- [ost-startStop-1] o.s.b.w.servlet.ServletRegistrationBean  : Mapping servlet: 'dispatcherServlet' to [/]
2017-01-03 03:48:22.810  INFO 22 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'characterEncodingFilter' to: [/*]
2017-01-03 03:48:22.811  INFO 22 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'hiddenHttpMethodFilter' to: [/*]
2017-01-03 03:48:22.811  INFO 22 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'httpPutFormContentFilter' to: [/*]
2017-01-03 03:48:22.811  INFO 22 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'requestContextFilter' to: [/*]
2017-01-03 03:48:23.094  INFO 22 --- [           main] s.w.s.m.m.a.RequestMappingHandlerAdapter : Looking for @ControllerAdvice: org.springframework.boot.context.embedded.AnnotationConfigEmbeddedWebApplicationContext@5a2e4553: startup date [Tue Jan 03 03:48:20 UTC 2017]; root of context hierarchy
2017-01-03 03:48:23.166  INFO 22 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/hello/say],methods=[GET]}" onto public java.lang.String com.colorcc.cloud.sample.docker.controller.HelloController.say(java.lang.String)
2017-01-03 03:48:23.168  INFO 22 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/error],produces=[text/html]}" onto public org.springframework.web.servlet.ModelAndView org.springframework.boot.autoconfigure.web.BasicErrorController.errorHtml(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse)
2017-01-03 03:48:23.168  INFO 22 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/error]}" onto public org.springframework.http.ResponseEntity<java.util.Map<java.lang.String, java.lang.Object>> org.springframework.boot.autoconfigure.web.BasicErrorController.error(javax.servlet.http.HttpServletRequest)
2017-01-03 03:48:23.193  INFO 22 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/webjars/**] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
2017-01-03 03:48:23.193  INFO 22 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
2017-01-03 03:48:23.227  INFO 22 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**/favicon.ico] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
2017-01-03 03:48:23.347  INFO 22 --- [           main] o.s.j.e.a.AnnotationMBeanExporter        : Registering beans for JMX exposure on startup
2017-01-03 03:48:23.394  INFO 22 --- [           main] s.b.c.e.t.TomcatEmbeddedServletContainer : Tomcat started on port(s): 8081 (http)
2017-01-03 03:48:23.398  INFO 22 --- [           main] c.c.c.s.docker.DockerSampleApplication   : Started DockerSampleApplication in 3.315 seconds (JVM running for 3.771)
2017-01-03 03:48:44.884  INFO 22 --- [nio-8081-exec-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring FrameworkServlet 'dispatcherServlet'
2017-01-03 03:48:44.884  INFO 22 --- [nio-8081-exec-1] o.s.web.servlet.DispatcherServlet        : FrameworkServlet 'dispatcherServlet': initialization started
2017-01-03 03:48:44.895  INFO 22 --- [nio-8081-exec-1] o.s.web.servlet.DispatcherServlet        : FrameworkServlet 'dispatcherServlet': initialization completed in 11 ms
root@jackqin /opt/dev/docker/myweb/docker-sample-hello $
```
```
root@jackqin /opt/dev/docker/myweb $docker push qintianjie/docker-sample-web:v0 
The push refers to a repository [docker.io/qintianjie/docker-sample-web]
a61a04c1f08a: Pushed 
176c91f7aff8: Pushed 
950f27fbf8ff: Pushed 
aeb8bcb73cbd: Pushed 
dd67823f63bd: Pushed 
fb10d5dbc2ec: Mounted from qintianjie/centos7java8 
f08bd51992bd: Mounted from qintianjie/centos7java8 
a785336f689b: Mounted from qintianjie/centos7java8 
c5fac13e4249: Mounted from qintianjie/centos7java8 
c0f305b6695b: Mounted from qintianjie/centos7java8 
64dce6972cb3: Mounted from qintianjie/centos7java8 
34e7b85d83e4: Mounted from qintianjie/centos7java8 
v0: digest: sha256:82b1d95e6e7a307c25ce743426d1d4ffe3aa56cf8c33b2b9cb80e28ee4d89579 size: 2826
```
