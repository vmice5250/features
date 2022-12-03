#!/bin/bash

set -e

source dev-container-features-test-lib

su - "$_REMOTE_USER" <<EOF
    check "doctl cli existance" doctl version
EOF


reportResults
