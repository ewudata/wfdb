#!/bin/sh
echo "
LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH

## Colorize the ls output ##
alias ls='ls --color=auto'

## get rid of command not found ##
alias cd..='cd ..'
 
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias mkdir='mkdir -pv'
" >> /home/vagrant/.bash_profile

apt-get --assume-yes install gcc libcurl4-openssl-dev libexpat1-dev \
  swig openjdk-7-jdk autoconf libtool git

wget https://www.physionet.org/physiotools/wfdb.tar.gz
wget http://physionet.org/physiotools/wfdb-swig.tar.gz
tar xfvz wfdb.tar.gz
tar xfvz wfdb-swig.tar.gz
cd /home/vagrant/wfdb-10.5.24
./configure
make install
make check

echo "bootstrap scirpt ends"
