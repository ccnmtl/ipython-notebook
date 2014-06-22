FROM  saltstack/ubuntu-13.10
RUN echo "deb http://archive.ubuntu.com/ubuntu saucy universe " >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y language-pack-en
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get install -y python-imaging python-cairo
RUN apt-get install -y build-essential python-pip python-dev
RUN apt-get install -y libfreetype6-dev libpng-dev

RUN pip install -U tornado
RUN pip install -U ipython
RUN pip install -U matplotlib
RUN pip install pygments
RUN apt-get install -y pandoc
RUN apt-get install -y python-scipy python-pandas
RUN pip install textblob scikit-learn nltk gensim ggplot
RUN apt-get install -y python-qt4

VOLUME /notebooks
WORKDIR /notebooks
EXPOSE 8888

# sudo docker build -t ipython-notebook .
# sudo docker run -p 8123:8888 -v `/bin/pwd`:/notebooks  -t ipython-notebook

CMD ipython notebook --pylab=inline --no-browser --ip=0.0.0.0 --port 8888
