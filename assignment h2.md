# Linux Servers - H2 assignment: More Puppet

#### Equipment used:

<pre>Lenovo Yoga 500
128GB SSD
8GB RAM
Intel(R) Core(TM) i5-5200U CPU @ 2.20G
Linux Live USB with Xubuntu 16.04 LTS 64-bit</pre>

# h2 
#### a) Create the report of this assignment with markdown into Github

#### b) Create a puppet-module, that makes the settings to a shell-based program or a tool using the graphical ui.


#### First I do the initial settings and installations for the assignment

* $ setxkbmap fi
* $ sudo apt-get update
* $ sudo apt-get upgrade

#### Install puppet and git for uploading the assignment to Github

* $ sudo apt-get install git
* $ sudo apt-get install puppet
* $ cd /etc/puppet/modules/

#### Create the modules for the assignment

* $ mkdir aliasmoduli
* $ cd aliasmoduli/
* $ mkdir manifests
* $ sudo mkdir manifests
* $ cd manifests/
* $ sudoedit init.pp

#### Following lines to create the file injection to create an alias for a bash command

<pre>class aliasmoduli {
          file {'/etc/bash.bashrc':
          content => template('aliasmoduli/bash.bashrc.erb')
            }  
}</pre>

#### Finding the appropriate bash file to edit to create the alias

* $ cd /etc/
* $ whereis bash
* $ cd /etc/
* $ find bash*
* $ sudoedit bash.bashrc

#### I add the lines

`alias h="history"` 

* $ cd puppet/modules/aliasmoduli/

#### Create the template section for the module

* $ sudo mkdir templates

#### Copy the edited alias bash file to the template so I can use when applying the module 

* $ sudo cp /etc/bash.bashrc /etc/puppet/modules/aliasmoduli/templates/bash.bashrc.erb

#### Wanted to install tree to get a better view of the file-trees

* $ sudo apt-get install tree
* $ tree
* $ sudoedit /manifests/init.pp

#### Trying out the new abreviated bash command for history

* $ h
* $ history

#### And it works as I test in normal form and the abbreviated one

#### I install the module through Git on a clean install of Linux and test it out

<pre>
     $ sudo apt-get install git
     $ setxkbmap fi
     $ sudo apt-get install git
     $ git clone github.com/jotenkim/hellopuppet
     $ git clone http://github.com/jotenkim/hellopuppet
     $ cd hellopuppet/
     $ sudo apt-get install puppet
     $ sudo cp -rf aliasmoduli /etc/puppet/modules/
 </pre>

#### Final testing occurs

<pre>$ sudo puppet apply -e 'class {"aliasmoduli":}' 

Notice: Compiled catalog for xubuntu.tielab.haaga-helia.fi in environment production in 0.10 seconds
Notice: /Stage[main]/Aliasmoduli/File[/etc/bash.bashrc]/content: content changed '{md5}d80b5c72ee089f1e43de3f084a69495c' to '{md5}05ca2387e196d487fd0e279365bf0d79'
Notice: Finished catalog run in 0.02 seconds</pre>

#### First you have to remember to open a new terminal for the setting to take effect

`ctrl + alt + t`

#### I do a few commands and test the history bash alias

<pre>xubuntu@xubuntu:~$ h
    1  h
    2  sudo apt-get update
    3  pwd
    4  h
</pre>

#### Test case done. It works.


### End comments

Refers to the Linux course [here](http://terokarvinen.com/2017/aikataulu-%E2%80%93-palvelinten-hallinta-ict4tn022-2-%E2%80%93-5-op-uusi-ops-loppukevat-2017-p2)

Markdown format [references](https://en.wikipedia.org/wiki/Markdown)

Bash [alias](https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions)

Puppet [file templates](https://docs.puppet.com/puppet/4.9/lang_template.html#using-templates)


