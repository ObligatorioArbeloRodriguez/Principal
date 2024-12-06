FROM maven:3.9.9-eclipse-temurin-21 AS builder


WORKDIR /build


COPY . .

RUN mvn clean package -DskipTests


FROM eclipse-temurin:21-alpine


WORKDIR /app



COPY --from=builder /build/target/*.jar app.jar


ENTRYPOINT ["java", "-jar", "app.jar"]

ENV APP_ARGS="http://dns1.example.com http://dns2.example.com http://dns3.example.com"

#Este dockerfile es similar al que usan los otros tres aplicativos, pero recibe como argumento los DNS de los mismos
