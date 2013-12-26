# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("1") do |config|
  config.vm.box = "openplatform-base"

#  config.vm.define :op1 do |op1_config|
#    op1_config.vm.network :hostonly, "192.168.100.10"
#    op1_config.vm.host_name = "op1.local"
#    op1_config.vm.provision :puppet do |op1_puppet|
#      op1_puppet.manifest_file = "op.pp"
#      op1_puppet.manifests_path = "manifests"
#      op1_puppet.module_path = "modules"
#    end
#  end
  
#  config.vm.define :op2 do |op2_config|
#    op2_config.vm.network :hostonly, "192.168.100.20"
#    op2_config.vm.host_name = "op2.local"
#    op2_config.vm.provision :puppet do |op2_puppet|
#      op2_puppet.manifest_file = "op.pp"
#      op2_puppet.manifests_path = "manifests"
#      op2_puppet.module_path = "modules"
#    end
#  end
  
   config.vm.define :opdb do |opdb_config|
    opdb_config.vm.network :hostonly, "192.168.100.30"
    opdb_config.vm.host_name = "opdb.local"
    opdb_config.vm.provision :puppet do |opdb_puppet|
      opdb_puppet.manifest_file = "db.pp"
      opdb_puppet.manifests_path = "manifests"
      opdb_puppet.module_path = "modules"
    end
  end

end

Vagrant.configure("2") do |config|
    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "512"]
    end
end
