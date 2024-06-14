FROM maven:3-openjdk-17 AS build
COPY ..
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
COPY --from=build \target\DrComputer-0.0.1-SNAPSHOT.war drcomputer.war
EXPOSE 8080 
ENTRYPOINT ["java","-jar","drcomputer.war"]
