# spring-angular-k8s  

spring-angular-docker-k8s-aks application.

`--registry=https://registry.npmjs.org` **: to ignore default registry or company registry**  

> `npm i @angular/cli@17.3.17 --registry=https://registry.npmjs.org`  
> `ng new ihm --no-standalone`  
> `npm i --registry=https://registry.npmjs.org`

### Local
* IHM  
`npm start `
[http://localhost:4200](http://localhost:4200)

* Backend  
`run the backend from your Idea` or using spring maven plugin `mvn spring-boot:run`
[http://localhost:8080](http://localhost:8080)

### build & generate docker images
* IHM  
  `ng build`  
  `docker buildx build -t othmanbouazzaoui/ihm-angular:1.0 .`  
  `docker push othmanbouazzaoui/ihm-angular:1.0`  

* Backend  
  `mvn clean install`  
  `docker buildx build -t othmanbouazzaoui/api-spring:1.0 .`  
  `docker push othmanbouazzaoui/api-spring:1.0 .`

* using sh script take 2 params TAG=1.0(replaced with your tag_id) + PUSH=true/false(push images to docker hub or not)  
  `./docker-job.sh TAG=1.0 PUSH=true`
  
### docker

> `docker rm ihm-angular -f | docker rm backend -f`  
> `docker network create app-network`

* backend  
> `docker run --name backend --network app-network -d -p 8080:8080 othmanbouazzaoui/api-spring:1.0`

* frontend : be sur that the backend is UP before running  
> `docker run --name ihm-angular --network app-network --env LOCAL_PROXY=true -p 4200:80 othmanbouazzaoui/ihm-angular:1.0`  

### docker compose

> `docker rm ihm-angular -f | docker rm backend -f`  
> `docker compose up -d`  
> `docker compose down`  

### k8s (comming soon 😉)
 - step 1 : declarative approach with simple config files .yaml  
  `cd k8s/native`  
  `kubectl apply -R -f .`  
   
  the Application will be availaible [http://localhost:30000](http://localhost:30000)  

  `kubectl delete -R -f .`  