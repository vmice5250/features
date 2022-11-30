#!/bin/bash

set -ex

source dev-container-features-test-lib


USERNAME=""
POSSIBLE_USERS=("vscode" "node" "codespace" "$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)")
for CURRENT_USER in "${POSSIBLE_USERS[@]}"; do
    if id -u ${CURRENT_USER} >/dev/null 2>&1; then
        USERNAME=${CURRENT_USER}
        break
    fi
done
if [ "${USERNAME}" = "" ]; then
    echo "could not resolve a non root user"
    exit 1
fi


echo "running test with user: $USERNAME"


sudo su - "$USERNAME" <<EOF
    check "ghci existance" ghci --version
    check "cabal existance" cabal --version
EOF

reportResults
