# Vagrant + OpenPlatform 

$ cd 

$ git clone https://github.com/bwahn/vagrant-op.git\

$ cd vagrant-op

$ mkdir templates

$ cd templates

$ wget http://files.vagrantup.com/precise64.box


$ cd ..

$ vagrant box add openplatform-base ./templates/precise64.box

$ vagrant up

$ vagrant ssh op1

$ vagrant ssh op2

$ vagrant ssh opdb


# Destroy All VM

$ vagrant destroy

# Destroy each VM

$ vagrant destroy op1

$ vagrant destroy op2

$ vagrant destroy opdb


