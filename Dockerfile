FROM ballerina/ballerina:1.0.5
WORKDIR /tmp/
COPY *.bal /tmp/
RUN ballerina build *.bal

FROM openjdk:8-jre-alpine
COPY --from=0 /tmp/*.jar .
CMD java -jar *.jar
