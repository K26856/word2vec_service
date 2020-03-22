#!/bin/bash

while true
do
    wakati=`wc -l wakati_wiki.txt | awk '{print $1}'`
    base=`wc -l parsed_wiki.txt | awk '{print $1}'`
    percent=$((wakati*100/base))
    now_time=`date +%T`
    clear
    echo "${now_time}    ${percent}% (${wakati} / ${base})"
    sleep ${1}
done
