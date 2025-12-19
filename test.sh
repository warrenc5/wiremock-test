#!/bin/bash
set -Eeuo pipefail
reset
BLUE='\e[34m'
RED='\e[31m'
GREEN='\e[32m'
CYAN='\e[36m'
MAGENTA='\e[35m'
RESET='\e[0m'

err() {
    echo -e "${RED}There was an error${RESET}" >&2;
}

trap 'err; exit 1' ERR
echo -e $BLUE
#curl -v http://localhost:8080/hello

curl -v -X POST http://localhost:8080/__admin/reset && echo -e "${GREEN} reset completed${RESET}"
echo -e $CYAN
curl -v -d @__files/primary-request-postserve.json http://localhost:8080/primary-postserve | tee /dev/stderr | jq -e '. == {"primary-response-primary-request":"postserve","primary-response":"WOW-postserve"}' &&  echo -e "${GREEN}POST_SERVE primary response passed${RESET}" || echo -e "${RED}POST_SERVE primary response FAILED${RESET}"
echo -e $MAGENTA
curl -v -d @__files/primary-request-serveevent.json http://localhost:8080/primary-serveevent | tee /dev/stderr | jq -e '. == {"primary-response-primary-request":"serveevent","primary-response":"WOW-serveevent"}' &&  echo -e "${GREEN}SERVE_EVENT primary response passed${RESET}" || echo -e "${RED}SERVE_EVENT primary response FAILED${RESET}"
