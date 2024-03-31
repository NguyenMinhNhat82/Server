FROM maven:3.8.5-openjdk-17 AS build
COPY . .

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/Server-1.0-SNAPSHOT.jar app.jar
EXPOSE 8084
ENTRYPOINT ["java","-jar","app.jar"]