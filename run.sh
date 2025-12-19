#mvn

cp -v /home/wozza/code/wiremock4/build/libs/wiremock-standalone*.jar ./target/dependency/
docker rm -f wiremock-test
docker buildx build . --progress=plain
docker run --name wiremock-test --network host -p 8080:8080 -v .:/app amazoncorretto:17-alpine-jdk java -jar app/target/dependency/$(basename target/dependency/wiremock-standalone*) --root-dir /app --global-response-templating --verbose true &

#test.sh
