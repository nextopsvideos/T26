# Use an official Maven image as the base image
FROM maven:3.8.4-openjdk-11
# Create a working directory inside the container
WORKDIR /app
# Copy the pom.xml file to the container
COPY pom.xml .
# Download the project dependencies
RUN mvn dependency:go-offline
# Copy the rest of the application source code to the container
COPY src ./src
# Build the application
RUN mvn package
# Define the command to run your application
CMD ["java", "-jar", "target/bmi-1.0.jar"]
# EXPOSE port
EXPOSE 8000