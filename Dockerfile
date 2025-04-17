FROM amazoncorretto:11-alpine3.21-jdk
WORKDIR /
ENTRYPOINT [ "wiremock.sh" ]
VOLUME /mappings
VOLUME /files
