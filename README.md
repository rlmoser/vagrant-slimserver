# vagrant-slimserver
Vagrant environment for Slimserver development

A quick and easy way to get a clone of the [Logitech/slimserver](https://github.com/Logitech/slimserver) git repository up and running in a variety of OS environments.

##Prerequisites
* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

##Environments
* CentOS 5.11, 6.6, 7.0
* Debian 7.8, 8.0
* Ubuntu 12.04, 14.04, 15.04

##Work still to do
* Test Vagrant/VBox in non-Linux environments
* Puppet module to set up environment for Logitech Media Server
* Port forwarding to allow for connections to LMS
* Rewrite this README

##Notes
The slimserver repository is cloned into a directory shared from the Host.  This enables subsequent Vagrant boxes to reuse the clone and avoid downloading multiple times.  The contents of the repo directory are ignored to prevent accidentally adding that repository into this one.

Similarly, puppet modules needed for provisioning are installed into the host shared `puppet/environments/dev/modules` directory, which is also ignored.
