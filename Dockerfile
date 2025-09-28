
#FROM maven:3.9.4-eclipse-temurin-17 AS firststage
#WORKDIR /app
#COPY pom.xml .
#RUN mvn dependency:go-offline \
#COPY src ./src
#RUN mvn clean package -DskipTests \
##Stage completed    \
#FROM eclipse-temurin:17-jre-alpine
#WORKDIR /app
#COPY --from=firststage /app/target/*.jar app.jar
#EXPOSE 8080
#ENTRYPOINT ["java", "-jar", "app.jar"]
#

# -------- Stage 1: Build --------
FROM maven:3.9.4-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code and build
COPY src ./src
RUN mvn clean package -DskipTests

# -------- Stage 2: Runtime --------
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Copy only the built JAR (not the whole target folder)
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]


