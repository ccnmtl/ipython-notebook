Dockerfile for a full ipython notebook setup including:

* numpy
* matplotlib (inline graphics enabled)
* pandas
* gensim
* nltk
* textblob
* ggplot

## Installation

### Step 0: install Docker.

Follow the
[instructions](http://docs.docker.com/installation/) for your
platform.

### Step 1: git clone this repo

    $ git clone git@github.com:ccnmtl/ipython-notebook.git

(or download the raw Dockerfile into an
appropriately named directory)

### Step 2: build your docker image

    $ cd ipython-notebook
    $ sudo docker build -t ipython-notebook .

This involves downloading and compiling a lot of software. Expect it
to take up to 15 or 20 minutes depending on your internet speed and
processing power.

### Step 3: run it

    $ sudo docker run -p 8123:8888 -v `/bin/pwd`:/notebooks  -t ipython-notebook

### Step 4: use it

You should now be able to point your browser at

   http://_youripaddress_:8123/

And start using it. If you are running docker locally, you can use
http://0.0.0.0:8123/

Use a different port than '8123' in the command above if that port is
already in use (eg, if you are running more than one instance on the
same machine).

Any Notebooks you create will be saved to the current
directory. Similarly, any other files in the current directory will be
available as data for your notebook.


### Step 5 (optional): modify

If there are other libraries that you want to use in your notebook,
the best approach is to install them via 'RUN' commands in the
Dockerfile. See docker's
[documentation](http://docs.docker.com/reference/builder/#run) on how
that works. The base is an Ubuntu 14.04 server image, so use whatever
commands you would need to install the library on that system (usually
`apt-get` or `pip install`). Keep in mind that Docker caches the state
of the image in between each RUN command to avoid having to re-run it
each time you build. That means that you want to add commands towards
the end if possible, or be ready to have it re-run lengthy compile
steps each time.
