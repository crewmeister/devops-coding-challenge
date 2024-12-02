# Use the official Maven image to build the application
FROM maven:3.8.5-openjdk-17 AS build

# Set working directory inside the container
WORKDIR /app

# Copy the pom.xml and Maven wrapper files first to cache dependencies
COPY pom.xml mvnw ./
COPY .mvn .mvn/

# Resolve Maven dependencies
RUN ./mvnw dependency:go-offline

# Copy the entire source code
COPY src ./src

# Package the application
RUN ./mvnw package -DskipTests

# Use a lightweight JDK image to run the app
FROM openjdk:17-jdk-slim

# Set working directory for the runtime container
WORKDIR /app

# Copy the built application from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port the app listens on
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
