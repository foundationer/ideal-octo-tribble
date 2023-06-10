FROM maven:3.9.2-eclipse-temurin-17 AS build
WORKDIR /code
COPY . /code/
RUN mvn clean package

FROM eclipse-temurin:17_jre
EXPOSE 3000
WORKDIR /app
COPY --from=target /code/build/libs/*.jar .
CMD java -jar *.jar
