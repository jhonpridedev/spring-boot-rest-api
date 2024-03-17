# App Microservicio CI Y CD
La Integración Continua, Entrega Continua y Despliegue Continuo, junto con Jenkins, abarcan las siguientes características:

- __Build__
    - Se realiza el empaquetado en un archivo .jar
- __Testing__
    - El informe de cobertura generado por Jacoco está disponible en http://34.210.54.28:8080/job/spring-boot-rest-api/lastBuild/jacoco/

- __Sonarqube__
    - Se analiza la calidad del código, cuyos resultados pueden consultarse http://34.210.54.28:9000/projects
- __DockerHub__
    - Las imágenes del proyecto están almacenadas en un repositorio público, accesible a través de https://hub.docker.com/r/jhonpridedev/spring-boot-rest-api/tags
- __Deploy__
    - El microservicio se despliega en la siguiente URL: http://34.210.54.28:9966/petclinic/swagger-ui/index.html

__Nota:__ Los accesos para Sonar y Jenkins se encuentran detallados en el correo electrónico enviado previamente.
