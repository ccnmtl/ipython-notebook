Vagrant configuration files for provisioning a full ipython notebook setup including

* numpy
* matplotlib (inline graphics enabled)
* pandas
* gensim
* nltk
* textblob
* ggplot

## Installation

### Step 0: install Virtual Box and Vagrant.
[Vagrant](http://docs.vagrantup.com/v2/getting-started/index.html) a tool for provisioning virtual machines, and can actually be used to create servers on on top of VMWare, Amazon, and, what we will be using VirtualBox.

First download and install Virtual Box:

[VirtualBox](http://www.virtualbox.org/)

Next, install Vagrant:

[Vagrant](http://www.vagrantup.com/)

### Step 1: Download the ipython-notebook vagrant box

vagrant box add ipython-notebook http://ccnmtl.columbia.edu/.../ipython-notebook.box
 
Note: - you can also use a standard ubunutu box, but you will need to recompile all the dependencies. The only other things we changed on this box are the ipython notebook profile. We customized the ipython_notebook_config.py with the following settings:

c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookManager.notebook_dir = u'/vagrant/notebooks'


### Step 2: git clone this repo

    $ git clone git@github.com:ccnmtl/ipython-notebook.git

(or download the raw Vagrantfile and bootstrap.sh into an appropriately named directory)

### Step 3:

vagrant up

### Visit your notebook:

If all went well, you can now visit your very own ipython notebook, from your host computer's browser, at 

http://localhost:8888 