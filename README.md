# Vagrant + OpenPlatform 

$ cd /Volumes/ERIC_DATA/vagrant/templates/
$ wget http://files.vagrantup.com/precise64.box
$ vagrant box add openplatform-base /Volumes/ERIC_DATA/vagrant/templates/precise64.box

$ vagrant up

$ vagrant ssh op1

$ vagrant ssh op2

$ vagrant ssh opdb

$ vagrant destroy
or
$ vagrant destroy op1
$ vagrant destroy op2
$ vagrant destroy opdb


