#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "localstack --version && localstack start -d && sleep 10 && localstack status docker && localstack status services && localstack stop" localstack --version && localstack start -d && sleep 10 && localstack status docker && localstack status services && localstack stop

reportResults
