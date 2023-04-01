#!/bin/bash -i

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/homebrew-package:1.0.3" \
    --option package="ffmpeg" --option version="$VERSION"


echo 'Done!'

