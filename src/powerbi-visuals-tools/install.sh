#!/bin/bash -i

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/npm-package:1.0.2" \
    --option package="powerbi-visuals-tools" --option version="$VERSION"


echo 'Done!'

