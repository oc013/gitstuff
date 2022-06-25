#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ ! -f "${DIR}/config" ]]; then
    echo -e "Run \e[00;31mcp config.example config\e[00m and setup the config file to continue."
    exit 1
fi

source ${DIR}/config

applyglobal=${applyglobal:=0}

if (( $applyglobal > 0 )); then
    globalflag="--global"
else
    globalflag=""
fi

git config ${globalflag} user.name ${username}
git config ${globalflag} user.email ${useremail}
git config ${globalflag} user.signingkey ${gpgkeyid}
git config ${globalflag} commit.gpgsign true