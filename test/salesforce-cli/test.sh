#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "sf --version" sf --version

reportResults
