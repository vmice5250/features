#!/bin/bash

set -x

source dev-container-features-test-lib

echo $USERNAME
echo $_REMOTE_USER
echo $USER
whoami 
id

sudo -iu "$USERNAME" <<EOF
    echo $USERNAME
    echo $USER
    whoami 
    id
EOF

# we are simply checking existance for now.
check "ghci existance" ghci --version
check "cabal existance" cabal --version



reportResults
