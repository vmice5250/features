#!/bin/bash -i

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/curl-apt-get:1.0.7" \
    


curl -fL https://install-cli.jfrog.io | sh && chown $_REMOTE_USER /usr/local/bin/jf && chmod a+x /usr/local/bin/jf

