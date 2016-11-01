#!/bin/sh
# yum -y install nano
# yum -y install epel-release
# yum -y -q update
yum -y install freeradius freeradius-utils

systemctl disable firewalld
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

echo "
## Colorize the ls output ##
alias ls='ls --color=auto'

## get rid of command not found ##
alias cd..='cd ..'
 
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias mkdir='mkdir -pv'
" >> /home/vagrant/.bash_profile

echo "client 10.0.2.2 {
  secret = ciena1!!
  shortname = vm
}" >> /etc/raddb/clients.conf

echo "esmuser Cleartext-Password := \"esmuser123\"
  ESM-UPC = 2,
  Ciena_CES_Priv_Level = 3,
  Login-Level = ADMIN,
  Reply-Message = \"Login-Level=3\"

test Cleartext-Password := \"test1234\"
  ESM-UPC = 2,
  Idle-Timeout = 4294967295" >> /etc/raddb/users

cp -f /vagrant/dictionary /etc/raddb/dictionary
cp -f /vagrant/dictionary.ciena /etc/raddb/dictionary.ciena
cp -f /vagrant/dictionary.ciena_tejas /etc/raddb/dictionary.ciena_tejas

systemctl start radiusd
echo "bootstrap scirpt ends"
