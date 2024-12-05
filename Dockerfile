
#Primero usamos docker in docker para compilar lo pesado
FROM maven:3.9.9-eclipse-temurin-21 AS builder

#ARG APP_NAME

#WORKDIR /app/$APP_NAME

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

# PASO 2: Armo la imagen en base a lo que hizo builder
FROM eclipse-temurin:21-alpine

#WORKDIR /app/$APP_NAME

WORKDIR /app

# Copy el build que creamos antes en el paso 1, al que le pusimos builder.
#COPY --from=builder /app/$APP_NAME/target/*.jar app.jar
COPY --from=builder /app/target/*.jar app.jar

# Ejecuta el archivo .JAR
CMD ["java", "-jar", "app.jar"]

