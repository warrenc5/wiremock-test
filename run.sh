mvn 
docker buildx build . --progress=plain 
docker run --network host -p 8080:8080 -v .:/app amazoncorretto:11-alpine3.21-jdk java -jar app/target/dependency/wiremock-standalone-3.12.1.jar --root-dir /app --global-response-templating --verbose true
