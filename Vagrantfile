# -*- mode: ruby -*-
# vi: set ft=ruby :

release    = ENV['RELEASE'] ? ENV['RELEASE'] : 'stable'
hostname   = 'devstack'
box        = ENV['BOX'] ? ENV['BOX'] : 'fedora/23-cloud-base'

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "devstack" do |devstack|
    # Box details
    devstack.vm.box = "#{box}"
    devstack.vm.hostname = "#{hostname}"


    # Box Specifications
    devstack.vm.provider :virtualbox do |vb|
      vb.name = "#{hostname}"
      vb.memory = 4096
      vb.cpus = 2
      config.vm.network "private_network", :type => 'dhcp', :adapter => 2
    end

    # Start shell provisioning.
    devstack.vm.provision "shell" do |s|
      s.path = "scripts/install_devstack.sh"
      s.args   = "rundevstack"
      s.privileged = false
    end
  end

end
