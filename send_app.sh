#!/bin/bash

if [ $# -ne 1 ]
then
    echo "usage ./send_app.sh {ipaddress}"
    exit -1
fi

scp ./jawiki_wv.model \
    ./jawiki_wv.model.vectors.npy \
    pi@${1}:/opt/word2vec_service/
