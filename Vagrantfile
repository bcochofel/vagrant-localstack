# -*- mode: ruby -*-
# vi: set ft=ruby :

# Check for missing plugins
required_plugins = %w(vagrant-hostmanager)
plugin_installed = false
required_plugins.each do |plugin|
  unless Vagrant.has_plugin?(plugin)
    system "vagrant plugin install #{plugin}"
    plugin_installed = true
  end
end

# If new plugins installed, restart Vagrant process
if plugin_installed === true
  exec "vagrant #{ARGV.join' '}"
end

Vagrant.configure("2") do |config|
  # vagrant-hostmanager options
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true

  # Forward ssh agent to easily ssh into the different machines
  config.ssh.forward_agent = true

  config.vm.box = "bento/ubuntu-18.04"
  config.vm.hostname = "localstack.local.dev"

  config.vm.network :private_network, ip: "192.168.77.105"
  config.vm.network :forwarded_port, guest: 8080, host: 8080
  for i in 4567..4599
    config.vm.network :forwarded_port, guest: i, host: i
  end

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.name = "Localstack"
    vb.memory = "4096"
    vb.cpus = "2"
  end

  config.vm.provision :docker
  config.vm.provision "shell", path: "install.sh"
end
