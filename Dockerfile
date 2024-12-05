
FROM maven:3.9.9-eclipse-temurin-21 AS builder

ARG APP_NAME=myapp

WORKDIR /app/$APP_NAME

# aca estaba . en vez de app name, el error puede que se solucione aca ya que no accedia al POM
COPY $APP_NAME .

RUN mvn clean package -DskipTests

# PASO 2: Ejecutar la aplicacion. NO SE SI LO NECESITO AHORA.
FROM eclipse-temurin:21-alpine

WORKDIR /app/$APP_NAME

# Copy el build que creamos antes en el paso 1, al que le pusimos builder.
COPY --from=builder /app/$APP_NAME/target/*.jar app.jar

# Ejecuta el archivo .JAR
CMD ["java", "-jar", "app.jar"]

