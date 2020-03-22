# installing
## install openssl 1.1.1
1. install
```bash
wget https://www.openssl.org/source/openssl-1.1.1e.tar.gz
tar xvzf openssl-1.1.1e.tar.gz
cd openssl-1.1.1e/
./config --prefix=/usr/local/openssl-1.1.1 shared zlib
make depend
make
make test
make install
```
2. add library path
```bash
echo /usr/local/openssl-1.1.1/lib > /etc/ld.so.conf.d/openssl111.conf
ldconfig
```
3. add bin path
```bash
ln -s openssl /usr/local/openssl-1.1.1/bin/openssl
```



## install python3.7
1. premise
```bash
apt-get update
apt-get install build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev
```
2. install
```bash
wget https://www.python.org/ftp/python/3.7.7/Python-3.7.7.tgz
tar xvzf Python-3.7.7.tgz
cd Python-3.7.7.tgz
./configure --with-openssl=/usr/local/openssl-1.1.1
make
make altinstall
```



## install gensim
```bash
pip3.7 install --upgrade pip
pip3.7 install gensim
```




# data
## wiki data
1. get and parse wiki data
```
wget https://github.com/attardi/wikiextractor/archive/master.zip
unzip master.zip
cd ./wikiextractor-master

wget https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-pages-articles.xml.bz2
python3 WikiExtractor.py jawiki-latest-pages-articles.xml.bz2
find text/ | grep wiki | awk '{system("cat "$0" >> wiki.txt")}'
egrep -v "<doc" wiki.txt | egrep -v "</doc" > parsed_wiki.txt
```
2. wakati
```sh
mecab -Owakati parsed_wiki.txt -o wakati_wiki.txt -b 50000
```

3. monitor process
```bash
while true
do
    wakati=`wc -l wakati_wiki.txt | awk '{print $1}'`
    base=`wc -l parsed_wiki.txt | awk '{print $1}'`
    percent=$((wakati*100/base))
    now_time=`date +%T`
    clear
    echo "${now_time}    ${percent}% (${wakati} / ${base})"
    sleep 30
done
```

4. make model word2vec
```
```


