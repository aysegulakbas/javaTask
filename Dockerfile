FROM maven:3.8.3-openjdk-17 AS builder

WORKDIR /javaTask
COPY pom.xml .
RUN mvn dependency:go-offline

COPY src/ src/
RUN mvn clean install

FROM openjdk:17-jdk AS stage-2

WORKDIR /javaTask
COPY --from=builder /javaTask/target/spring-petclinic-3.2.0-SNAPSHOT.jar ./
EXPOSE 8080
CMD ["java", "-jar", "-DPOSTGRES_USER=petclinic", "-DPOSTGRES_PASS=petclinic", "-DPOSTGRES_URL=jdbc:postgresql://postgresql:5432/petclinic", "-Dspring.profiles.active=postgres", "/javaTask/spring-petclinic-3.2.0-SNAPSHOT.jar"]
