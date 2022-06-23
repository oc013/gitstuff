#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${DIR}/config

git config user.name ${username}
git config user.email ${useremail}
git config user.signingkey ${gpgkeyid}
git config commit.gpgsign true