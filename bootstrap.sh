#!/bin/sh
echo "
LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH

## Colorize the ls output ##
alias ls='ls --color=auto'
alias ll='ls -l'

## get rid of command not found ##
alias cd..='cd ..'
 
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias mkdir='mkdir -pv'
" >> /home/vagrant/.bash_profile

apt-get update
apt-get --assume-yes install gcc libcurl4-openssl-dev libexpat1-dev 

su -c "wget --quiet https://www.physionet.org/physiotools/wfdb.tar.gz" vagrant
su -c "tar xfvz wfdb.tar.gz" vagrant
cd /home/vagrant/wfdb-10.5.24
./configure
make install
make check

  # swig openjdk-7-jdk autoconf libtool git

# su -c "wget --quiet https://physionet.org/physiotools/archives/wfdb-swig-10.5.0.tar.gz" vagrant
# su -c "wget --quiet http://physionet.org/physiotools/wfdb-swig.tar.gz" vagrant
# su -c "tar xfvz wfdb-swig.tar.gz" vagrant

echo "bootstrap scirpt ends"
