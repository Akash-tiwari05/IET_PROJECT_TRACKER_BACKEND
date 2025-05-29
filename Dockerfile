FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
COPY --from=build /target/Project_Tracker-0.0.1-SNAPSHOT.jar project.jar
EXPOSE 5454

ENTRYPOINT ["java","-jar","project.jar"]