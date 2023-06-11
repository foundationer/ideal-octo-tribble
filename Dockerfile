FROM maven:3.9.2-eclipse-temurin-17 as build
WORKDIR /code
COPY . /code/
RUN mvn package

FROM eclipse-temurin:17-jre
EXPOSE 3000
WORKDIR /app
COPY --from=build /code/target/*.jar .
CMD java -jar *.jar