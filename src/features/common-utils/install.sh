#!/usr/bin/env bash

set -o errexit -o pipefail

USERNAME="${USERNAME:-"${_REMOTE_USER:-"vscode"}"}"
HOME="/home/${USERNAME}"
FEATURE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function install() {
    $(which sudo) apt-get update
    export DEBIAN_FRONTEND=noninteractive
    $(which sudo) apt-get install -y --no-install-recommends "$@"
    apt-get autoremove -y
    apt-get clean -y
    rm -rf /var/lib/apt/lists/*
}

function install_apt() {
    install \
        apt-transport-https \
        apt-utils \
        bash-completion \
        bzip2 \
        build-essential \
        ca-certificates \
        curl \
        git \
        gpg \
        gpg-agent \
        init-system-helpers \
        jq \
        less \
        lsb-release \
        lsof \
        make \
        nano \
        net-tools \
        openssh-client \
        procps \
        psmisc \
        rsync \
        strace \
        sudo \
        tree \
        unzip \
        vim \
        wget \
        xz-utils \
        zip \
        zsh
}

function setup_files() {
    if type bash > /dev/null 2>&1; then
        cat "${FEATURE_DIR}/files/.bashrc" >> "${HOME}"/.bashrc
        sudo chown "${USERNAME}":"${USERNAME}" "${HOME}"/.bashrc
        sudo chmod 644 "${HOME}"/.bashrc
        touch "${HOME}"/.bash_history
        sudo chown "${USERNAME}":"${USERNAME}" "${HOME}"/.bash_history
        sudo chmod 600 "${HOME}"/.bash_history
    fi

    if type git > /dev/null 2>&1; then
        sudo git config --system --add safe.directory '*'
        cat "${FEATURE_DIR}/files/.netrc" >> "${HOME}"/.netrc
        sudo chown "${USERNAME}":"${USERNAME}" "${HOME}"/.netrc
        sudo chmod 644 "${HOME}"/.netrc
    fi

    if type zsh > /dev/null 2>&1; then
        git clone https://github.com/zsh-users/zsh-autosuggestions "${HOME}"/.zsh/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${HOME}"/.zsh/zsh-syntax-highlighting
        cat "${FEATURE_DIR}/files/.zshrc" >> "${HOME}"/.zshrc
        sudo chown "${USERNAME}":"${USERNAME}" "${HOME}"/.zshrc
        sudo chmod 644 "${HOME}"/.zshrc
        touch "${HOME}"/.zsh_history
        sudo chown "${USERNAME}":"${USERNAME}" "${HOME}"/.zsh_history
        sudo chmod 600 "${HOME}"/.zsh_history
    fi

    if type ssh > /dev/null 2>&1; then
        mkdir -p "${HOME}"/.ssh
        cat "${FEATURE_DIR}/files/config" >> "${HOME}"/.ssh/config
        sudo chown "${USERNAME}":"${USERNAME}" "${HOME}"/.ssh/config
        sudo chmod 644 "${HOME}"/.ssh/config
    fi
}

function main() {
    install_apt
    setup_files
}

main
