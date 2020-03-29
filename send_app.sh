#!/bin/bash

if [ $# -ne 1 ]
then
    echo "usage ./send_app.sh {ipaddress}"
    exit -1
fi

scp ./jawiki.model \
    ./jawiki.model.trainables.syn1neg.npy \
    ./jawaiki.model.wv.vectors.npy \
    pi@${1}:/opt/word2vec_service/
