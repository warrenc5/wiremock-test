#curl -v http://localhost:8080/hello
curl -v -X POST http://localhost:8080/__admin/reset
curl -v -d @__files/primary-request.json http://localhost:8080/primary
curl -v -d @__files/primary-request.json http://localhost:8080/primary-serveevent
