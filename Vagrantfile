# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu/trusty32"
    #config.vm.box_url = "https://vagrantcloud.com/hashicorp/trusty64"

    config.vm.hostname = "web4d-qsar.box"
    config.ssh.forward_agent = true

    config.vm.network :forwarded_port, guest: 8000, host: 8000

    #config.vm.synced_folder "../data", "/vagrant_data"

    config.vm.provision :shell, path: "bootstrap.sh"

    config.vm.provider "virtualbox" do |v|
        #v.name = "Web4D-QSAR"
        #v.gui = true

        v.memory = 1024
        v.cpus = 1
    end
end

