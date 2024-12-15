FROM openjdk:17
WORKDIR /app
COPY /app/abc.jar  /app
EXPOSE 8080
CMD []