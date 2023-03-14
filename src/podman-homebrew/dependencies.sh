#!/usr/bin/env bash
# This code was generated by the dcontainer cli 
# For more information: https://github.com/devcontainers-contrib/cli 

set -e
ensure_jq() {
    # Ensure JQ available
    if ! type jq >/dev/null 2>&1; then
        apt-get update -y && apt-get -y install --no-install-recommends jq
    fi 
}


ensure_pipx() {
    # Ensure the existance of minimal python3 and pipx
    # If no python - install it
	if ! type python3 >/dev/null 2>&1; then
		echo "installing python3-minimal libffi-dev"
		apt-get update -y
		apt-get -y install python3-minimal
	fi

	# If no pip - install it
	if ! type pip3 >/dev/null 2>&1; then
		echo "installing python3-pip"
		apt-get update -y
		apt-get -y install libffi-dev python3-pip
	fi

    # If ensurepip fails - install python venv
	if ! python3 -Im ensurepip --version >/dev/null 2>&1; then
		echo "installing python3-venv"
		apt-get update -y
		apt-get -y install python3-venv
	fi

    # If no pipx - install it
    if ! pipx >/dev/null 2>&1; then
        pip3 install pipx
    fi
}

ensure_curl() {
    # Ensure curl available
    if ! type curl >/dev/null 2>&1; then
        apt-get update -y && apt-get -y install --no-install-recommends curl ca-certificates
    fi 
}


ensure_dcontainer() {
    # Ensure existance of the dcontainer cli program
    local variable_name=$1
    local dcontainer_location=""

    # If possible - try to use an already installed dcontainer
    if [[ -z "${DCONTAINER_FORCE_CLI_INSTALLATION}" ]]; then
        if [[ -z "${DCONTAINER_CLI_LOCATION}" ]]; then
            if type dcontainer >/dev/null 2>&1; then
                dcontainer_location=dcontainer
            fi
        elif [ -f "${DCONTAINER_CLI_LOCATION}" ] && [ -x "${DCONTAINER_CLI_LOCATION}" ] ; then
            dcontainer_location=${DCONTAINER_CLI_LOCATION}
        fi
    fi

    # If not previuse installation found, download it temporarly and delete at the end of the script 
    if [[ -z "${dcontainer_location}" ]]; then

        if [ "$(uname -sm)" != "Linux x86_64" ]; then
            # No binaries compiled for non linux x*^ yet, therefor we fallback to install through python

            ensure_pipx
            ensure_jq
            pipx install dcontainer==v0.2.3
            dcontainer_location=$(pipx list --json | jq ".venvs.dcontainer.metadata.main_package.app_paths[0].__Path__" | tr -d '"')

        else
            tmp_dir=$(mktemp -d -t dcontainer-XXXXXXXXXX)

            clean_up () {
                ARG=$?
                rm -rf $tmp_dir
                exit $ARG
            }
            trap clean_up EXIT
            curl -sSL -o $tmp_dir/dcontainer https://github.com/devcontainers-contrib/cli/releases/download/v0.2.3/dcontainer-x86_64-unknown-linux-gnu 
            chmod a+x $tmp_dir/dcontainer
            dcontainer_location=$tmp_dir/dcontainer
        fi
    fi

    # Expose outside the resolved location
    declare -g ${variable_name}=$dcontainer_location

}

ensure_curl

ensure_dcontainer dcontainer_location

$dcontainer_location \
    feature install \
    "ghcr.io/devcontainers-contrib/features/homebrew-package:1.0.3" \
    --option package="podman" --option version="$VERSION"


