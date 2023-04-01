#!/bin/bash -i

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/apt-get-packages:1.0.0" \
    --option packages="libsasl2-dev g++"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/pipx-package:1.1.3" \
    --option package="localstack[full]" --option version="$VERSION"


echo 'Done!'

