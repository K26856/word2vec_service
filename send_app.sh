#!/bin/bash

if [ $# -ne 3 ]
then
    echo "usage ./send_app.sh {user} {ipaddress} {dir}"
    exit -1
fi

scp ./jawiki_wv.model \
    ./jawiki_wv.model.vectors.npy \
    ${1}@${2}:${3}
