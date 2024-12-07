
#Primero usamos docker in docker para compilar lo pesado
FROM maven:3.9.9-eclipse-temurin-21 AS builder


WORKDIR /build


COPY . .

RUN mvn clean package -DskipTests

# PASO 2: Armo la imagen en base a lo que hizo builder
FROM eclipse-temurin:21-alpine


WORKDIR /app


# Copy el build que creamos antes en el paso 1, al que le pusimos builder.
COPY --from=builder /build/target/*.jar app.jar

# Ejecuta el archivo .JAR
CMD ["java", "-jar", "app.jar"]

