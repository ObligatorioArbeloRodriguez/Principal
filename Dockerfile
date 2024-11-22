
FROM maven:3.9.9-eclipse-temurin-21 AS builder

ARG APP_NAME=myapp

WORKDIR /app/$APP_NAME

COPY . .

RUN mvn clean package -DskipTests


