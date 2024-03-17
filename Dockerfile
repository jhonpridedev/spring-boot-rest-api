FROM eclipse-temurin:17-jre-alpine
WORKDIR /workspace
COPY target/spring-boot-rest-api-*.jar app.jar
EXPOSE 9966
ENTRYPOINT [ "java", "-jar", "/workspace/app.jar" ]
