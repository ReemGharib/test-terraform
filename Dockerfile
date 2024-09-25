FROM openjdk:21-jdk-slim
EXPOSE 8080
WORKDIR /app
COPY target/my-terraform-0.0.1-SNAPSHOT.jar /app/my-terraform-0.0.1-SNAPSHOT.jar
CMD ["java", "-jar", "my-terraform-0.0.1-SNAPSHOT.jar"]