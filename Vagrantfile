# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.2"
  config.vm.hostname = "radius"

  config.vm.network "forwarded_port", guest: 1812, host: 1812, protocol: "udp"
  config.vm.network "forwarded_port", guest: 1813, host: 1813, protocol: "udp"
  # config.vm.network "forwarded_port", guest: 3306, host: 3306

  # config.vm.provider "virtualbox" do |v|
  #   v.linked_clone = true
  # end

  config.vm.provision "shell" do |s|
    s.path = "bootstrap.sh"
    s.name = "bootstrap"
  end

end
