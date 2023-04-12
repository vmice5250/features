#!/bin/bash -i

set -e

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.4.16"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers/features/dotnet:1.1.3" \
    --option dotnetVersion="$DOTNETVERSION" --option runtimeOnly='true'


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/gh-release:1.0.8" \
    --option repo='actions/runner' --option binaryName='run.sh' --option binLocation='$_REMOTE_USER_HOME/.local/bin' --option version="$VERSION" --option libLocation='$_REMOTE_USER_HOME' --option libName='actions-runner' --option assetRegex='^(?!.*(trimmedpackages))(.*-noruntime.*)(.*-noexternals.*)'


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/bash-command:1.0.0" \
    --option command='rm /home/vscode/.local/bin/run.sh && \
   chown -hR ${_REMOTE_USER}:${_REMOTE_USER} $_REMOTE_USER_HOME/actions-runner && \
   ln -s $_REMOTE_USER_HOME/actions-runner/runsvc.sh $_REMOTE_USER_HOME/.local/bin/runsvc.sh && \
   ln -s $_REMOTE_USER_HOME/actions-runner/run.sh $_REMOTE_USER_HOME/.local/bin/run.sh'


echo GitHub Actions Runner now installed at $_REMOTE_USER_HOME/actions-runner

