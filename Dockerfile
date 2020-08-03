FROM openjdk:8
ADD target/testingrepo.jar testingrepo.jar
EXPOSE 9001
ENTRYPOINT  ["java","-jar","/testingrepo.jar"]