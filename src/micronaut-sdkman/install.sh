#!/bin/bash -i

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/bash-command:1.0.0" \
    --option command="[[ \"$(ldd --version | grep -Eoh '2\.[0-9]+$'  | sed 's/2.//')\" > \"33\" ]] && echo \"gclib version is compatible\" && exit 0 || echo \"glibc version is lower than the minimum required (2.34). exiting\" && exit 1"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers/features/java:1.1.1" \
    --option jdkDistro="$JDKDISTRO" --option version="$JDKVERSION"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/ebaskoro/devcontainer-features/sdkman:1.0.0" \
    --option candidate="micronaut" --option version="$VERSION"


echo 'Done!'

