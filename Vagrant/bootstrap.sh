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

pip install tornado==3.1.1
pip install ipython==2.1.0
pip install matplotlib==1.3.1
pip install pygments==1.6
apt-get install -y pandoc
apt-get install -y python-scipy python-pandas
pip install textblob==0.8.4 scikit-learn==0.14.1 nltk==2.0.4 gensim==0.10.0 ggplot==0.5.8
apt-get install -y python-qt4
apt-get install -y libxml2-dev libxslt1-dev python-dev
(pip install networkx==1.9 pdfminer==20140328 powerlaw==1.3 pypdf2==1.22 slate==0.3 beautifulsoup4==4.2.1 \
    ner==0.1 httplib2==0.8 lxml==3.3.5 mechanize==0.2.5 selenium==2.42.1)
pip install http://py-editdist.googlecode.com/files/py-editdist-0.3.tar.gz
