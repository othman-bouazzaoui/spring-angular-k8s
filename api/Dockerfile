FROM eclipse-temurin:17-jre-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} application.jar
#ENTRYPOINT ["java","-jar","/application.jar", "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"]
#EXPOSE 8080 5005
#5005 for debug mode
ENTRYPOINT ["java","-jar","/application.jar"]
EXPOSE 8080