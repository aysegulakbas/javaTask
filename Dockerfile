FROM openjdk:17-slim 

WORKDIR /javaTask

COPY pom.xml ./
RUN apt-get update && apt-get install -y openjdk-17-jdk
RUN mvn install

FROM openjdk:17-slim

WORKDIR /javaTask

COPY target/spring-petclinic-3.2.0-SNAPSHOT.jar ./

EXPOSE 8080

CMD ["java", "-jar","-DPOSTGRES_USER=petclinic", "-DPOSTGRES_PASS=petclinic" ,  "-DPOSTGRES_URL=jdbc:postgresql://postgresql:5432/petclinic" , "-Dspring.profiles.active=postgres","/javaTask/spring-petclinic-3.2.0-SNAPSHOT.jar"]

