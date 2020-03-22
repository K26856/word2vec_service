#!/bin/bash
wget --no-check-certificate https://github.com/attardi/wikiextractor/archive/master.zip
unzip master.zip

wget --no-check-certificate https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-pages-articles.xml.bz2
python3 ./wikiextractor-master/WikiExtractor.py jawiki-latest-pages-articles.xml.bz2
find text/ | grep wiki | awk '{system("cat "$0" >> wiki.txt")}'
egrep -v "<doc" wiki.txt | egrep -v "</doc" > parsed_wiki.txt
