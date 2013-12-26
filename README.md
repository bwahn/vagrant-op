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

## check vm

$ ls -la

rwxr-xr-x  11 user  staff   374 12 26 23:39 .

drwxr-xr-x  14 user  staff   476 12 24 19:28 ..

drwxr-xr-x   3 user  staff   102 12 24 19:35 .vagrant

$ cd .vagrant

$ ll

total 0

drwxr-xr-x  5 user  staff  170 12 25 01:09 machines

$ cd machines

$ ll

total 0

drwxr-xr-x  3 user  staff  102 12 24 19:35 op1

drwxr-xr-x  3 user  staff  102 12 24 19:35 op2

drwxr-xr-x  3 user  staff  102 12 25 01:09 opdb

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


