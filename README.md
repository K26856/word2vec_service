# installation
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
ln -s /usr/local/bin/openssl /usr/local/openssl-1.1.1/bin/openssl
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
cd Python-3.7.7
./configure --with-openssl=/usr/local/openssl-1.1.1
make
make altinstall
```



## install gensim
```bash
pip3.7 install --upgrade pip
pip3.7 install gensim
```




# premise data
## wiki data
1. get and parse wiki data
```sh
./get_wikidata.sh
```
2. wakati
```
mecab -Owakati parsed_wiki.txt -o wakati_wiki.txt -b 50000
```
3. monitor process
```bash
./monitor.sh 10
```
4. make model word2vec
```
python3.7 make_model.py
```


# Usage memo
## load model
```python
from gensim.models import word2vec
model = word2vec.Word2VecKeyedVectors.load("jawiki_wv.model") 
```