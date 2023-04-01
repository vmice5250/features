#!/bin/bash -i

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers/features/python:1.0.18" \
    --option installTools="False" --option version="os-provided"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/bash-command:1.0.0" \
    --option command="pip3 install packaging==21.3"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/pipx-package:1.1.3" \
    --option package="eth-brownie" --option version="$VERSION"


echo 'Done!'

