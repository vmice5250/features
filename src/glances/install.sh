#!/bin/bash -i

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/pipx-package:1.1.3" \
    --option package="glances[action,browser,cloud,cpuinfo,docker,export,folders,gpu,graph,ip,raid,snmp,web,wifi]" --option version="$VERSION"


echo 'Done!'

