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
		git clone git://github.com/CPAN-API/Metacpan-Puppet.git
		git clone git://github.com/CPAN-API/cpan-api.git
		git clone git://github.com/CPAN-API/metacpan-web.git

	- What are these repos?
		- Metacpan-Puppet is the sysadmin/server setup
		- cpan-api is the backend that talks to the elasticsearch
		- metacpan-web - is the web front end

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

- To edit

	Make changes in the submodules repos these are mounted as

	- puppet /etc/puppet
	- web /home/metacpan/metacpan.org
	- api /home/metacpan/api.metacpan.org

	You can then restart the relevant services or run puppet as needed from within the virtual machine


### Uploading your code changes

