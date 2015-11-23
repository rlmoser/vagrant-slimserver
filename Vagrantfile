# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  $modulescript = <<SCRIPT
modulepath=/vagrant/puppet/environments/dev/modules
if [ ! -d "$modulepath/vcsrepo" ]
then
  puppet module install puppetlabs-vcsrepo --target-dir=$modulepath
fi
if [ ! -d "$modulepath/alternatives" ]
then
  puppet module install adrien-alternatives --target-dir=$modulepath
fi
# for when I get around to publishing the module on Puppetforge
#if [ ! -d "$modulepath/squeezeboxserver" ]
#then
#  puppet module install rlmoser-squeezeboxserver --target-dir=$modulepath
#fi
SCRIPT

  if ['d6','d7','d8','u12','u14','u15'].include?(ARGV[1])
    config.vm.provision "fix-no-tty", type: "shell" do |s|
      s.privileged = false
      s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
    end
  end
  if ARGV[1] == 'd8'
    config.vm.provision "puppet-apt-get", type: "shell", inline: "apt-get install -y puppet"
  end
  if ['f20','build'].include?(ARGV[1])
    config.vm.provision "puppet-yum", type: "shell", inline: "yum install -y puppet"
  end
  config.vm.provision "module-check", type: "shell", inline: $modulescript
  if ['f20','build'].include?(ARGV[1])
    config.vm.provision "puppet" do |puppet|
      puppet.module_path    = 'puppet/environments/dev/modules'
      puppet.manifests_path = 'puppet/environments/dev/manifests'
      puppet.manifest_file  = 'site.pp'
    end
  else 
    config.vm.provision "puppet" do |puppet|
      puppet.environment_path = 'puppet/environments'
      puppet.environment = 'dev'
    end
  end

  config.vm.synced_folder "repo", "/opt/repo"

  config.vm.define :c5, autostart: false do |c5|
    c5.vm.box = "puppetlabs/centos-5.11-64-puppet"
  end
  config.vm.define :c6, autostart: false do |c6|
    c6.vm.box = "puppetlabs/centos-6.6-64-puppet"
  end
  config.vm.define :c7, autostart: false do |c7|
    c7.vm.box = "puppetlabs/centos-7.0-64-puppet"
  end
  config.vm.define :build, autostart: false do |build|
    build.vm.box = "boxcutter/fedora20"
    build.vm.hostname = "builder.slimdevices.com"
  end
  config.vm.define :f20, autostart: false do |f20|
    f20.vm.box = "boxcutter/fedora20"
  end
  config.vm.define :d6, autostart: false do |d6|
    d6.vm.box = "puppetlabs/debian-6.0.10-64-puppet"
  end
  config.vm.define :d7, autostart: false do |d7|
    d7.vm.box = "puppetlabs/debian-7.8-64-puppet"
  end
  config.vm.define :d8, autostart: false do |d8|
    d8.vm.box = "debian/jessie64"
  end
  config.vm.define :u12, autostart: false do |u12|
    u12.vm.box = "puppetlabs/ubuntu-12.04-64-puppet"
  end
  config.vm.define :u14, autostart: false do |u14|
    u14.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
  end
  config.vm.define :u15, autostart: false do |u15|
    u15.vm.box = "ubuntu/vivid64"
  end
end
