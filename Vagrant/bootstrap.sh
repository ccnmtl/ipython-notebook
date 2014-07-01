#!/usr/bin/env bash

apt-get update
apt-get upgrade -y
apt-get install -y language-pack-en
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

locale-gen en_US.UTF-8
dpkg-reconfigure locales

apt-get install -y python-imaging python-cairo
apt-get install -y build-essential python-pip python-dev
apt-get install -y libfreetype6-dev libpng-dev
apt-get build-dep -y python-matplotlib
apt-get build-dep -y ipython-notebook

pip install tornado
pip install ipython
pip install matplotlib
pip install pygments
apt-get install -y pandoc
apt-get install -y python-scipy python-pandas
pip install textblob scikit-learn nltk gensim ggplot
apt-get install -y python-qt4
apt-get install -y libxml2-dev libxslt1-dev python-dev
(pip install networkx pdfminer powerlaw pypdf2 slate beautifulsoup4 \
    ner httplib2 lxml mechanize selenium)
pip install http://py-editdist.googlecode.com/files/py-editdist-0.3.tar.gz
