# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "wfdb"

  # config.vm.network "forwarded_port", guest: 3306, host: 3306

  # config.vm.provider "virtualbox" do |v|
  #   v.linked_clone = true
  #   vb.memory = "1024"
  #   vb.gui = true
  # end

  config.vm.provision "shell" do |s|
    s.path = "bootstrap.sh"
    s.name = "bootstrap"
  end

end
