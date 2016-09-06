# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "server4001/bento-puppet"
  config.vm.box_version = "0.1.0"

  config.vm.define "yum-repo" do |yum|
    yum.vm.network :private_network, ip: "192.168.35.49"
    yum.vm.network :forwarded_port, guest: 22, host: 8116, auto_correct: true

    yum.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=775,fmode=664"]
    yum.vm.hostname = "dev.yum-repo.loc"

    yum.vm.provision :puppet do |puppet|
      puppet.options = "--verbose"
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "vagrant.pp"
      puppet.hiera_config_path = "puppet/hiera.yaml"
    end

    yum.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "90"]
      vb.customize ["modifyvm", :id, "--memory", "1024"]
      vb.customize ["modifyvm", :id, "--cpus", "1"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end

  config.vm.define "yum-consumer" do |consumer|
    consumer.vm.network :private_network, ip: "192.168.35.50"
    consumer.vm.network :forwarded_port, guest: 22, host: 8117, auto_correct: true

    consumer.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=775,fmode=664"]
    consumer.vm.hostname = "dev.yum-consumer.loc"

    consumer.vm.provision :puppet do |puppet|
      puppet.options = "--verbose"
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "vagrant.pp"
      puppet.hiera_config_path = "puppet/hiera.yaml"
    end

    consumer.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "90"]
      vb.customize ["modifyvm", :id, "--memory", "512"]
      vb.customize ["modifyvm", :id, "--cpus", "1"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end
end
