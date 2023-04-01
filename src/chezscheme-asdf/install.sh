#!/bin/bash -i

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/apt-get-packages:1.0.0" \
    --option packages="build-essential uuid-dev libncurses5-dev libx11-dev"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/asdf-package:1.0.5" \
    --option plugin="chezscheme" --option version="$VERSION"


echo 'Done!'

