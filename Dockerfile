FROM maven:3.8.3-openjdk-17 AS builder

FROM builder AS stage-1

##WORKDIR /javaTask
COPY pom.xml .

COPY src/ src/
RUN mvn install

FROM builder AS stage-2

##WORKDIR /javaTask
COPY target/spring-petclinic-3.2.0-SNAPSHOT.jar ./
EXPOSE 8080
CMD ["java", "-jar","-DPOSTGRES_USER=petclinic", "-DPOSTGRES_PASS=petclinic" ,  "-DPOSTGRES_URL=jdbc:postgresql://postgresql:5432/petclinic" , "-Dspring.profiles.active=postgres","/javaTask/spring-petclinic-3.2.0-SNAPSHOT.jar"]


