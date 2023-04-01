#!/bin/bash -i

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/npm-package:1.0.2" \
    --option package="mocha" --option version="$VERSION"


echo 'Done!'

