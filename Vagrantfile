# Setup the number of master and worker nodes
MASTER_NBR = 1
WORKER_NBR = 2

# Vagrant configuration
Vagrant.configure("2") do |config|
  config.vm.box = "generic/debian"

  # Master node configuration
  (1..MASTER_NBR).each do |i|
    config.ssh.insert_key = true

    config.vm.define "master-#{i}" do |node|
      node.vm.hostname = "master-#{i}"
      node.vm.network "private_network", ip: "192.168.56.10#{i}"
      node.vm.network "private_network", ip: "172.254.0.1#{i}", virtualbox__intnet: true

      config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
        v.check_guest_additions = false
      end
    end
  end

  # Worker node configuration
  (1..WORKER_NBR).each do |i|
    config.ssh.insert_key = true

    config.vm.define "worker-#{i}" do |node|
      node.vm.hostname = "worker-#{i}"
      node.vm.network "private_network", ip: "192.168.56.20#{i}"
      node.vm.network "private_network", ip: "172.254.0.2#{i}", virtualbox__intnet: true 

      config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
        v.check_guest_additions = false
      end
    end
  end

  # Provisioning: Install essential software on all nodes and utilities
  config.vm.provision "shell", inline: <<-SHELL
    zypper -n up 
    zypper -n install sudo curl vim software-properties-common python3-openshift python3-pyyaml-env-tag python3-kubernetes
  SHELL

  # Provisioning: Custom bashrc file
  config.vm.provision "file", source: "./utils/files/.bashrc", destination: "$HOME/.bashrc"
end

