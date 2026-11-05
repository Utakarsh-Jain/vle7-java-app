FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY HelloWorld.java .

RUN javac --add-modules jdk.httpserver HelloWorld.java

EXPOSE 8080

CMD ["java", "--add-modules", "jdk.httpserver", "HelloWorld"]
