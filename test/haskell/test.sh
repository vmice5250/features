#!/bin/bash

set -x

source dev-container-features-test-lib

echo $USERNAME
echo $USER
whoami 
id


# we are simply checking existance for now.
check "ghci existance" ghci --version
check "cabal existance" cabal --version



reportResults
