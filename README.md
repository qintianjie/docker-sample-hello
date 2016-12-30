Docker HUB:
    https://hub.docker.com/u/qintianjie/   


docker pull qintianjie/centos7java8  
docker build -t qintianjie/docker-sample-web:v0 .  
docker run -d -p 8082:8081 qintianjie/docker-sample-web:v0   
docker logs XXX  

Verify:  

curl http://localhost:8082/hello/say?name=Jack  
