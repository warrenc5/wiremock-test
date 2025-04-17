#!/bin/bash -x

cd `dirname $0`

cp -vua /home/wozza/code/wiremock/wiremock-webhooks-extension/build/libs/wiremock-webhooks-extension-2.35.0.jar responder/target/dependency/wiremock-webhooks-extension-2.35.0.jar

cp -uav ../../../code/kafka-ra/library/src/main/avro/*.avsc responder/
