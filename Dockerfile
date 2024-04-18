# Use the official Java 17 base image
FROM adoptopenjdk:17-jdk-hotspot

# Set the working directory inside the container
WORKDIR /app

# Copy the Spring Boot application JAR file to the container
COPY target/demo-0.0.1-SNAPSHOT.jar /app/demo.jar

# Expose the port that the Spring Boot application listens on
EXPOSE 9090

# Run the Spring Boot application when the container starts
CMD ["java", "-jar", "demo.jar"]