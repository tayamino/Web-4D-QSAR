# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu/trusty64"
    #config.vm.box_url = "https://vagrantcloud.com/hashicorp/trusty64"

    config.vm.hostname = "web4d-qsar.box"
    config.ssh.forward_agent = true

    config.vm.network :forwarded_port, guest: 80, host: 4567

    #config.vm.synced_folder "../data", "/vagrant_data"

    config.vm.provision :shell, path: "bootstrap.sh"

    config.vm.provider "virtualbox" do |v|
        v.name = "my_vm"

        v.memory = 1024
        v.cpus = 2
    end
end

