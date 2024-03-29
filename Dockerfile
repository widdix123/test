FROM maven:latest

COPY spring-petclinic /spring-petclinic/

RUN cd /spring-petclinic/ \
    && unset MAVEN_CONFIG \
    && ./mvnw package
    
EXPOSE 8080

CMD java -jar target/*.jar
