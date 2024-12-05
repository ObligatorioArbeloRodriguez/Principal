
#Primero usamos docker in docker para compilar lo pesado
FROM maven:3.9.9-eclipse-temurin-21 AS builder

ARG APP_NAME=nombre-app-default

#WORKDIR /build
WORKDIR /build/$APP_NAME


COPY . .

RUN mvn clean package -DskipTests

# PASO 2: Armo la imagen en base a lo que hizo builder
FROM eclipse-temurin:21-alpine

ARG APP_NAME=nombre-app-default

#WORKDIR /$APP_NAME
WORKDIR /$APP_NAME


# Copy el build que creamos antes en el paso 1, al que le pusimos builder.
COPY --from=builder /build/$APP_NAME/target/*.jar app.jar

# Ejecuta el archivo .JAR
CMD ["java", "-jar", "app.jar"]

