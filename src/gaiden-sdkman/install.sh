#!/bin/bash -i

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers/features/java:1.1.1" \
    --option jdkDistro="$JDKDISTRO" --option version="$JDKVERSION"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/ebaskoro/devcontainer-features/sdkman:1.0.0" \
    --option candidate="gaiden" --option version="$VERSION"


export JDK_JAVA_OPTIONS="--add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.time=ALL-UNNAMED"

