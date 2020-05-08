Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.vm.synced_folder ".", "/vagrant", disabled: false
  config.ssh.forward_agent = true
  #config.ssh.insert_key = false
  config.vm.provision "file", source: "/Users/gpontrandolfi/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/authorized_keys.new"
  config.vm.provision "shell", inline: "cat /home/vagrant/.ssh/authorized_keys.new >> /home/vagrant/.ssh/authorized_keys"
  config.vm.provision "file", source: "/Users/gpontrandolfi/.ssh/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
  config.vm.provision "shell", path: "./provisioner.sh"

    config.vm.define "rancher0" do |server|
        server.vm.box = "centos/7"
        # server.vm.hostname = "server.prod.ocprm.local"
        server.vm.hostname = "rancher0"
        server.vm.network "private_network", ip: "192.168.89.5"
        config.vm.provider "virtualbox" do |v|
          v.cpus = 2
          v.customize ["modifyvm", :id, "--cpuexecutioncap", "40"]
          v.memory = 3000
        end
    end
    config.vm.define "rancher1" do |server|
      server.vm.box = "centos/7"
      server.vm.network "private_network", ip: "192.168.89.6"
      #server.vm.hostname = "server.prod.octo.local"
      server.vm.hostname = "rancher1"
      config.vm.provider "virtualbox" do |v|
        v.cpus = 2
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "40"]
        v.memory = 3000
      end
    end
    config.vm.define "rancher2" do |server|
      server.vm.box = "centos/7"
      server.vm.network "private_network", ip: "192.168.89.7"
      # server.vm.hostname = "server.prod.ocpdc.local"
      server.vm.hostname = "rancher2"
      config.vm.provider "virtualbox" do |v|
        v.cpus = 2
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "40"]
        v.memory = 3000
      end
    end
end
