#mvn 
cp -v /home/wozza/code/wiremock2/build/libs/wiremock-standalone*.jar ./target/dependency/
docker buildx build . --progress=plain 
docker run --network host -p 8080:8080 -v .:/app amazoncorretto:17-alpine-jdk java -jar app/target/dependency/wiremock-standalone-4.0.0-beta.14.jar --root-dir /app --global-response-templating --verbose true
