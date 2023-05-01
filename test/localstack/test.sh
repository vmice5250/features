#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "id && stat /var/lib/localstack && sleep 5 && docker ps && localstack --version && localstack start -d && sleep 10 && localstack status docker && localstack status services && localstack stop" id && ls -l /var/lib/localstack && sleep 5 && docker ps && localstack --version && localstack start -d && sleep 10 && localstack status docker && localstack status services && localstack stop

reportResults
