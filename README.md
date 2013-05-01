# Creating and managing virtual development machines for Metacpan

## This is under development - not ready yet!

-  Check out this repo

		git clone git://github.com/CPAN-API/metacpan-vagrant.git

-  Setup repositories

	Make a 'metacpan' directory at the same level and check out the repositories
	which will be shared into the virtual machine, below we are cloning
	the official repositories as read only - you could of course either
	fork any of these, or just add your own fork as a remote to push to.

		mkdir metacpan
		cd metacpan
		git clone git://github.com/CPAN-API/metacpan-puppet.git
		git clone git://github.com/CPAN-API/cpan-api.git
		git clone git://github.com/CPAN-API/metacpan-web.git

- Install [Vagrant](http://downloads.vagrantup.com/)

- Choose the type of development machine you need:
	- vm_base (minimal install with puppet having been run)
	- vm_minicpan (base + minicpan having been run and loaded into ElasticSearch)

			cd [machine_type]

- Start the virtual machine

		vagrant up

- Connect

		vagrant ssh
		sudo su -     (to become root)

- To edit and test

	Make changes in your checked out 'metacpan' repos and restart the service or use the run.sh script for puppet

	- metacpan-web is the web front end
		- mounted as /home/metacpan/metacpan.org
		- service metacpan-www restart
	- cpan-api is the backend that talks to the elasticsearch
		- mounted as /home/metacpan/api.metacpan.org
		- service metacpan-api restart
	- metacpan-puppet is the sysadmin/server setup
		- mounted as /etc/puppet
		- /etc/puppet/run.sh


