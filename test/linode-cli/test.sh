#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "linode-cli --version" linode-cli --version

reportResults
