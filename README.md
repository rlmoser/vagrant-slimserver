# vagrant-slimserver
Vagrant environment for Slimserver development

A quick and easy way to get a clone of the [Logitech/slimserver](https://github.com/Logitech/slimserver) up and running in a variety of OS environments.

##Prerequisites
* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

##Work still to do
* Test Vagrant/VBox in non-Linux environments
* Puppet module to set up environment for Logitech Media Server
* Port forwarding to allow for connections to LMS
* Rewrite this README

##Notes
The slimserver repository is cloned into a directory shared from the Host.  This enables subsequent Vagrant boxes to reuse the clone and avoid downloading multiple times.  The contents of the repo directory are ignored to prevent accidentally adding that repository into this one.
Similarly, puppet modules needed for provisioning are installed into the host shared `puppet/environments/dev/modules` directory, which is also ignored.
