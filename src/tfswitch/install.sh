#!/bin/bash -i

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/curl-apt-get:1.0.7" \
    


curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash

