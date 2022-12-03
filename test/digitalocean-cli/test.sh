#!/bin/bash

set -e

source dev-container-features-test-lib


USERNAME="${USERNAME:-"${_REMOTE_USER:-""}"}"
if [ "${USERNAME}" = "" ]; then
    USERNAME=""
    POSSIBLE_USERS=("vscode" "node" "codespace" "$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)")
    for CURRENT_USER in "${POSSIBLE_USERS[@]}"; do
        if id -u ${CURRENT_USER} > /dev/null 2>&1; then
            USERNAME=${CURRENT_USER}
            break
        fi
    done
    if [ "${USERNAME}" = "" ]; then
        USERNAME=root
    fi
fi


sudo su - "$USERNAME" <<EOF
    check "doctl cli existance" doctl version
EOF

reportResults
