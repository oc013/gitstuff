#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ ! -f "${DIR}/config" ]]; then
    echo -e "Run \e[00;31mcp config.example config\e[00m and setup the config file to continue."
    exit 1
fi

source ${DIR}/config

git config user.name ${username}
git config user.email ${useremail}
git config user.signingkey ${gpgkeyid}
git config commit.gpgsign true