# Vagrant + OpenPlatform 

## git clone vagrant-op

$ cd 

$ git clone https://github.com/bwahn/vagrant-op.git

$ cd vagrant-op

## download box image

$ mkdir templates

$ cd templates

$ wget http://files.vagrantup.com/precise64.box

## box add

$ cd ..

$ vagrant box add openplatform-base ./templates/precise64.box
or 
$ ./01-box-add.sh

## All box up

$ vagrant up

or 

$ ./02-box-up.sh

## SSH login

$ vagrant ssh op1

$ vagrant ssh op2

$ vagrant ssh opdb


## Destroy All VM

$ vagrant destroy

## Destroy a VM

$ vagrant destroy op1

$ vagrant destroy op2

$ vagrant destroy opdb


