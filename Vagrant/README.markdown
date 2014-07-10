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

**On Windows**, you should also install ssh software. [Cywin](https://www.cygwin.com/), [PuTTY](http://www.putty.org/) or [Git](http://git-scm.com/download/win) are all viable options.  Git is probably the simplest:

[Git](http://git-scm.com/download/win)

Upon install, the Git installer will prompt you to choose how to "Adjust your Path environment." Select the bottom option: "Run Git and included Unix tools from the Windows Command Prompt". 

### Step 1: Create a new <MY VAGRANT HOME> folder, with this repo's Vagrantfile and bootstrap.sh 

You can create a new directory anywhere. We'll refer to this directory as <MY VAGRANT HOME> in the rest of this documentation.

#### Option A:

Download this entire project and unzip. 

    https://github.com/ccnmtl/ipython-notebook/archive/master.zip

Copy the contents of ipython-notebook-master/Vagrant/ into <MY VAGRANT HOME>. 
    
#### Option B:

Download the raw [Vagrantfile](https://raw.githubusercontent.com/ccnmtl/ipython-notebook/master/Vagrant/Vagrantfile) and [bootstrap.sh](https://raw.githubusercontent.com/ccnmtl/ipython-notebook/master/Vagrant/bootstrap.sh) and move them into <MY VAGRANT HOME>.  

#### Option C:

Fork and clone this repo
    $ git clone git@github.com:<your git user>/ipython-notebook.git
    $ cd ipython-notebook/vagrant/


### Step 2: Starting your new vagrant virtual server

Change directories so that you are within the same directory as the Vagrantfile
    $ cd <MY VAGRANT HOME>
    $ vagrant up

### Step 3: Visit your notebook:

If all went well, you can now visit your very own ipython notebook, from your host computer's browser, at 

    http://localhost:8888 

Your notebook will be able to access files in the 'notebooks' sub-directory beneath the directory you started vagrant in.

### Step 4: Access your vagrant

From inside the directory you started vagrant in, <MY VAGRANT HOME>, run

    $ vagrant ssh
    
You should now be shelled into the ipython virtual server. 

### Step 5: Access your ipython Notebooks and share data/files between your vagrant server and your host computer

The directory /vagrant from within the vagrant server is shared with your host computer. You can read/write files in your <MY VAGRANT FILE> directory. Notebooks will be written to /vagrant/notebooks which is shared with <MY VAGRANT HOME>/notebooks.

The ipython server is configured to autatically create <MY VAGRANT HOME>/notebooks if it doesn't already exist, and the ipython notebook app will look in this directory to read/write .ipynb files. 

### Step 6: Restarting and Troubleshooting ipython-notebook

The ipython server is managed by ubuntu's [upstart](http://upstart.ubuntu.com/) daemon manager.

You can restart the server with

    $ sudo restart ipython-notebook

or
    $ sudo stop ipython-notebook
    $ sudo start ipython-notebook
    
Logs are written to /var/log/upstart/ipython-notebook. You can trace the logs with 

    $ sudo tail -f /var/log/upstrat/ipython-notebook

### Appendix
The Vagrantfile will download the ipython-notebook box for you.  If you want to reuse this box, you can add the box
 
    vagrant box add ipython-notebook http://ccnmtl.columbia.edu/projects/ipython-notebook/ipython-notebook_trusty_amd64.box
 
and then run:

    vagrant init ipython-notebook
    
Note: - you can also use a standard ubunutu box, but you will need to recompile all the dependencies. The only other things we changed on this box are the ipython notebook profile. We customized the ipython_notebook_config.py with the following settings:

    c.NotebookApp.ip = '*'
    c.NotebookApp.open_browser = False
    c.NotebookManager.notebook_dir = u'/vagrant/notebooks'


