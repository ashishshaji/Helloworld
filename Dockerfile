# Use JDK image (includes Java + tools)
FROM eclipse-temurin:17-jdk-alpine

# Set working directory inside the container
WORKDIR /app

# Install Maven (since alpine doesn’t have it by default)
RUN apk add --no-cache maven

# Copy project files into the container
COPY pom.xml .
COPY src ./src

# Build the JAR file
RUN mvn clean package -DskipTests

# Copy the generated JAR into app.jar
COPY target/helloworld-0.0.1-SNAPSHOT.jar app.jar

# Expose Spring Boot default port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java","-jar","app.jar"]
